import React, { Component } from 'react'
import { View, StyleSheet, ActivityIndicator, Dimensions, TouchableOpacity, Text } from 'react-native'
import RootSiblings from 'react-native-root-siblings';
const { width, height } = Dimensions.get('window');

let sibling = undefined

const AlertUtil = {
	show: (title, subTitle, cancelAction, confirmAction) => {
		sibling = new RootSiblings(
			<View style={styles.maskStyle}>
				<View style={styles.backViewStyle}>
					<View style={{ height: 25 }} />
					<Text style={styles.titleLbl}>{title}</Text>
					<View style={{ height: 10 }} />			
					<View>{subTitle}</View>
					<View style={{ height: 14 }} />
					<View style={styles.seperatorLine} />
					<View style={{ flexDirection: 'row' }}>
						<TouchableOpacity style={styles.touchView} onPress={cancelAction}>
							<Text style={styles.cancelBtn}>取消</Text> 
						</TouchableOpacity>
						<View style={styles.widthSeperatorLine} />
						<TouchableOpacity style={styles.touchView} onPress={confirmAction}>
							<Text style={styles.confirmBtn}>确定</Text> 
						</TouchableOpacity>
					</View>
				</View>
			</View>
		)
	},

	hidden: () => {
		if (sibling instanceof RootSiblings) {
			sibling.destroy()
		}
	}
}

const styles = StyleSheet.create({
	maskStyle: {
		position: 'absolute',
		backgroundColor: 'rgba(33, 33, 33, 0.5)',
		width: width,
		height: height,
		alignItems: 'center',
		justifyContent: 'center'
	},
	backViewStyle: {
		backgroundColor: '#fff',
		width: 280,
		alignItems: 'center',
		borderRadius: 5,
	},

	seperatorLine: {
		height: 1,
		width: 280,
		backgroundColor: 'rgba(216,216,216,0.4)',
	},
	widthSeperatorLine: {
		width: 1,
		backgroundColor: 'rgba(216,216,216,0.4)',
	},

	titleLbl: {
		fontSize: 14,
		color: '#666'
	},
	subTitleLbl: {
		fontSize: 15,
		color: '#888888'
	},
	cancelBtn: {
		color: '#FD5208',
		fontSize: 18,
	},
	confirmBtn: {
		color: '#08B2FD',
		fontSize: 18,
	},
	touchView: {
		justifyContent: 'center',
		width: 140,
		height: 50,
		alignItems: 'center',
	},
})

export { AlertUtil }
