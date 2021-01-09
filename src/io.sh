#!/bin/bash

# -----------------------------------------------
# Option Parsing function for:
# -i<1..n> [files.. ] -p<1..n> {values} -o<1..n> [files.. ]
# {-iX fileX} {-pX valueX} {-oX fileX}
#
#
# - Please pass 3 Arguments to this script
#   - Arg1: Number of Inputs expected
#   - Arg2: Number of Parameters expected
#   - Arg3: Number of Outputs expected
# -----------------------------------------------

INUM=$1; shift
PNUM=$1; shift
ONUM=$1; shift

set_variables()
{
    for ((i=1; i<=INUM; i++)); do typeset ICOUNT$i=0; done
    for ((i=1; i<=PNUM; i++)); do typeset PCOUNT$i=0; done
    for ((i=1; i<=ONUM; i++)); do typeset OCOUNT$i=0; done
}

IFLAG=();
PFLAG=();
OFLAG=();
reset_flags()
{
    for ((j=1; j<=INUM; j++)); do IFLAG[$j]='0'; done
    for ((j=1; j<=PNUM; j++)); do PFLAG[$j]='0'; done
    for ((k=1; k<=ONUM; k++)); do OFLAG[$k]='0'; done
}

set_variables
reset_flags

while [ $# -gt 0 ]
do
    case "$1" in
        -i*) in=$(echo $1 | cut -di -f2); reset_flags; IFLAG[$in]='1';;
        -p*) pa=$(echo $1 | cut -dp -f2); reset_flags; PFLAG[$pa]='1';;
        -o*) op=$(echo $1 | cut -do -f2); reset_flags; OFLAG[$op]='1';;
        --) shift; break;;
        *)  for((ind=1; ind<=INUM; ind++)); do
                if [ "${IFLAG[$ind]}" = "1" ]
                then
                    x=""
                    if [ "${INPUTS[$ind]}" != "" ]; then x="|"; fi
                    INPUTS[$ind]="${INPUTS[$ind]}$x$1"
                fi
            done
            for((ind=1; ind<=PNUM; ind++)); do
                if [ "${PFLAG[$ind]}" = "1" ]
                then
                    x=""
                    if [ "${PARAM[$ind]}" != "" ]; then x="|"; fi
                    PARAMS[$ind]="${PARAMS[$ind]}$x$1"
                fi
            done
            for((ind=1; ind<=ONUM; ind++)); do
                if [ "${OFLAG[$ind]}" = "1" ]
                then
                    x=""
                    if [ "${OUTPUTS[$ind]}" != "" ]; then x="|"; fi
                    OUTPUTS[$ind]="${OUTPUTS[$ind]}$x$1"
                fi
            done;;
    esac
    shift
done

IFS='|'
for ((i=1; i<=INUM; i++)); do typeset INPUTS$i=$(echo ${INPUTS[$i]}); done
for ((i=1; i<=PNUM; i++)); do typeset PARAMS$i=$(echo ${PARAMS[$i]}); done
for ((i=1; i<=ONUM; i++)); do typeset OUTPUTS$i=$(echo ${OUTPUTS[$i]}); done
IFS=' '

soil_plant_ini=${INPUTS1}
export soil_plant_ini
hyd_sed_lte_cha=${INPUTS2}
export hyd_sed_lte_cha
field_fld=${INPUTS3}
export field_fld
management_sch=${INPUTS4}
export management_sch
aqu_unit_ele=${INPUTS5}
export aqu_unit_ele
rout_unit_ele=${INPUTS6}
export rout_unit_ele
channel_lte_cha=${INPUTS7}
export channel_lte_cha
aqu_cha_lin=${INPUTS8}
export aqu_cha_lin
rout_unit_con=${INPUTS9}
export rout_unit_con
chan_surf_lin=${INPUTS10}
export chan_surf_lin
septic_sep=${INPUTS11}
export septic_sep
harv_ops=${INPUTS12}
export harv_ops
initial_aqu=${INPUTS13}
export initial_aqu
landuse_lum=${INPUTS14}
export landuse_lum
rout_unit_rtu=${INPUTS15}
export rout_unit_rtu
nutrients_sol=${INPUTS16}
export nutrients_sol
soils_sol=${INPUTS17}
export soils_sol
hru_con=${INPUTS18}
export hru_con
lum_dtl=${INPUTS19}
export lum_dtl
nutrients_cha=${INPUTS20}
export nutrients_cha
flo_con_dtl=${INPUTS21}
export flo_con_dtl
hru_data_hru=${INPUTS22}
export hru_data_hru
septic_str=${INPUTS23}
export septic_str
weather_sta_cli=${INPUTS24}
export weather_sta_cli
ccw01_pcp=${INPUTS25}
export ccw01_pcp
ls_unit_def=${INPUTS26}
export ls_unit_def
weather_wgn_cli=${INPUTS27}
export weather_wgn_cli
initial_cha=${INPUTS28}
export initial_cha
chandeg_con=${INPUTS29}
export chandeg_con
parameters_bsn=${INPUTS30}
export parameters_bsn
cntable_lum=${INPUTS31}
export cntable_lum
snow_sno=${INPUTS32}
export snow_sno
pesticide_pst=${INPUTS33}
export pesticide_pst
rout_unit_def=${INPUTS34}
export rout_unit_def
fertilizer_frt=${INPUTS35}
export fertilizer_frt
ovn_table_lum=${INPUTS36}
export ovn_table_lum
res_rel_dtl=${INPUTS37}
export res_rel_dtl
sweep_ops=${INPUTS38}
export sweep_ops
hydrology_cha=${INPUTS39}
export hydrology_cha
hydrology_hyd=${INPUTS40}
export hydrology_hyd
pathogens_pth=${INPUTS41}
export pathogens_pth
aquifer_con=${INPUTS42}
export aquifer_con
time_sim=${INPUTS43}
export time_sim
cons_practice_lum=${INPUTS44}
export cons_practice_lum
pcp_cli=${INPUTS45}
export pcp_cli
scen_lu_dtl=${INPUTS46}
export scen_lu_dtl
urban_urb=${INPUTS47}
export urban_urb
plants_plt=${INPUTS48}
export plants_plt
tillage_til=${INPUTS49}
export tillage_til
ls_unit_ele=${INPUTS50}
export ls_unit_ele
codes_bsn=${INPUTS51}
export codes_bsn
graze_ops=${INPUTS52}
export graze_ops
chem_app_ops=${INPUTS53}
export chem_app_ops
sediment_cha=${INPUTS54}
export sediment_cha
channel_cha=${INPUTS55}
export channel_cha
print_prt=${INPUTS56}
export print_prt
om_water_ini=${INPUTS57}
export om_water_ini
topography_hyd=${INPUTS58}
export topography_hyd
tmp_cli=${INPUTS59}
export tmp_cli
object_prt=${INPUTS60}
export object_prt
plant_ini=${INPUTS61}
export plant_ini
ccw01_tmp=${INPUTS62}
export ccw01_tmp
aquifer_aqu=${INPUTS63}
export aquifer_aqu
object_cnt=${INPUTS64}
export object_cnt



## PARAMETERS VARIABLES


find . -maxdepth 1 -name '*.zip' -execdir unzip '{}' ';'

umask 0000

## PARAMETERS VARIABLES
if [ ! -f file.cio.bk ]; then
  cp file.cio file.cio.bk
fi

envsubst < file.cio.bk> file.cio
rm file.cio.bk


