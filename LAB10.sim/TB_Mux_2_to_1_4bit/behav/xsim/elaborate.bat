@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu Jul 28 03:49:21 +0530 2022
REM SW Build 2258646 on Thu Jun 14 20:03:12 MDT 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
call xelab  -wto f330702f431647419194c50ab3747a93 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot TB_Mux_2_to_1_4bit_behav xil_defaultlib.TB_Mux_2_to_1_4bit -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
