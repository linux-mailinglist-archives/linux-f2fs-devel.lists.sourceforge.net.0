Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B2887FC5B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Mar 2024 11:56:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmX8t-0004rC-Ay;
	Tue, 19 Mar 2024 10:56:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=801f15ad6=shinichiro.kawasaki@wdc.com>)
 id 1rmX8s-0004r6-Cs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Mar 2024 10:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FoVTwUY8eLWkbWdYVmAFzoLaGbgR+lZyHRhsolK4NmA=; b=hov1PePFYsShDCNrLWqRwY9prK
 T9tgIpAZ6ngmXbpkSlG4lUTc7jmpk/BpzZwE2WmKdG517hIKT4dO6G8K5Svr9Ahao1oiX0Q8SG6qa
 fY/Stiot2CXUX0z7HzSYTGxk3x3lqL0fEX0ZTk5e2EEMPoqJGQvrjKLKVT3moJ01oxSc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FoVTwUY8eLWkbWdYVmAFzoLaGbgR+lZyHRhsolK4NmA=; b=FUuvkdFIv+J6H/oR32Fue8bA6w
 o3+5ezDftjFEkyy5hjFfQhw5fhsXVfgVSvGlOYVIYC9Vjt7imWlHLTrdd5/jvJU6nNba1mQb2kSJd
 r7nEQRqtemtJyUrOG5W1EJWXcl14up9w6eVDzDs6xQC55buxtoMf2WOkZbkPte/SGoaI=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmX8i-0007KC-LH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Mar 2024 10:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1710845784; x=1742381784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FoVTwUY8eLWkbWdYVmAFzoLaGbgR+lZyHRhsolK4NmA=;
 b=EyH1xjdAC3rDNxmmpjS6bhVwLtKojUvkXuFQJoshppRtjjsbKDbRoII4
 xJwlCRChyGoIjzTEwoPK95KViUTH4YLVF4lBcu7xvtgqifZi+69ErhlOG
 /OxC6t5eO/UTF3hYgOfLfI1zbQO938WbmwJ182gJwwUuNFbWQnDVlDgf3
 QdfclZ7S/gyfjq6aOz3JJIljgTfBFkNDj/qeixaDtOvswuWyw7AQ6ISc3
 +jhcEkorI4j42HUXTlhCm0R4fCAXV2sGR4T/n5eXUpSsmwPpMcAfxKxl1
 JESPvD0CUGWQSFZRxeUAUgC1VHDLboVDzYu7KGRMxXNUUxr+ccDhksIkq Q==;
X-CSE-ConnectionGUID: vpu9EKeGRc2tuDgGnI+OYg==
X-CSE-MsgGUID: 0hDSY78dSo61woPqx8x+Tg==
X-IronPort-AV: E=Sophos;i="6.07,136,1708358400"; d="scan'208";a="11769945"
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hgst.iphmx.com with ESMTP; 19 Mar 2024 18:56:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+cVpYAgad+wIhXcy21OMBABMSquQSp7l4RbukN1Kn/92XBKaRC5/IxDbEd5KS/0RXRQBeyhhDrdlpNtSeqQMQc+eKwb3SvUbE+NlWpaWSprty7LfiPMOTmLoaeWClITbzfSlRVgEQvP49LgpYfMFdqotbzmXWig5WflVt/6bMEYGO8Xb30AQ6iRhjouWgxXCrXE+OGGOpE38F076BtVto1h7WBxhXw4x6JS4+sT1R3IfvHnaG3sygYWBLIk4gun67s24bAXuSafSketu43HLhfZvoeK55WjNFkiFW/FAfCcFIpKEj6gGXJixEHpSZRloClLNYL1XfjMqCEc+NTjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoVTwUY8eLWkbWdYVmAFzoLaGbgR+lZyHRhsolK4NmA=;
 b=KQs50CGKIkO72R7/6qpEo0QzwoerAA4Ffob0vSwBEInk9cN5O/iBfCpF7UbpK2ekVtsk1jYcd1vcSquoSFpXaEDt8q9kJIwrnWvExozzNTaMEBALSHcgwdZPVdosDj6SuNUN8bxSBmU8gYCQbkl3IYysCidtZtzb97h+Mqq58wzPOen4dQ9EkB1zVWh2aQd4eS8HfE/njShTe+eWzCqirfmqiF3C88uT86nl7/zaaex0iX+AZMDwruP8WjXuRmziVINUPTzLmNp6yne+2/M/NUtuBn9yH1mG+mDbaFeVt/aEaYn6stNlceyvjatkiLYCI69nB38Zn0hIfxd/ctsFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoVTwUY8eLWkbWdYVmAFzoLaGbgR+lZyHRhsolK4NmA=;
 b=NeLUelkUbq55/Bx+jxKUonv1BnO20BCp4k9NoWMQsOdXMj1S1FcpaHb1KpnWdhZhYY140ChXuXvdUHJThtcrccaHBCAux7tMVu/rHEhMSzfzhdoq+DdgFuzTzm5X0xZXRvrMeAuSZlsxiIfzozMIOkegTnX12Ffz9dH2xAwA7Qg=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 CH3PR04MB8831.namprd04.prod.outlook.com (2603:10b6:610:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 10:56:11 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c9e3:b196:e5ea:909b]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c9e3:b196:e5ea:909b%4]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 10:56:11 +0000
To: Daeho Jeong <daeho43@gmail.com>
Thread-Topic: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
Thread-Index: AQHaYovQw4Cp4i7GhUK8xyPo7C3fjLEfp86AgAAQ4ICAAtxGAIAQ9nqAgAAi6wCAAE15gIAJLoeAgAECZgCAAOZDAA==
Date: Tue, 19 Mar 2024 10:56:11 +0000
Message-ID: <xuuuw57eh4wwbthqe22n6n32m3ejkzzlkpwcicob6h7wfobkt6@j3znemafupbv>
References: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
 <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
 <CAHj4cs874FivTdmw=VMJwTzzLFZWb4OKqvNGRN0R0O+Oiv4aYA@mail.gmail.com>
 <CAHj4cs_eOSafp0=cbwjNPR6X2342GF_cnUTcXf6RjrMnoOHSmQ@mail.gmail.com>
 <msec3wnqtvlsnfsw34uyrircyco3j3y7yb4gj75ofz5gnn57mg@qzcq5eumjwy5>
 <CAHj4cs-DC7QQH1W3KSzXS8ERMPW-6XQ9-w_Mzr1zEGF7ZZ=K3w@mail.gmail.com>
 <d6vi6aq44c4a7ekhck6zxxy4woa5q7v5bnvn5qmad7nqk7egms@ptc72tum4bks>
 <gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye>
 <CACOAw_ydoaJTDu1eu+Lasz4AHReHqT5Pgd9a1h5Y4E8y_Hh-8A@mail.gmail.com>
In-Reply-To: <CACOAw_ydoaJTDu1eu+Lasz4AHReHqT5Pgd9a1h5Y4E8y_Hh-8A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|CH3PR04MB8831:EE_
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i85xV1roB/ZxV8sHeJ576Ct+iVekAyM/jJ4e/JoZIIZ8K5vzgnMmnTptQtxLiN1/qeIMc0OxmuRhJ56SVlkLdnl2I8vlnFAC9v9892SvrI2+nHc7xOV+FFOEeZWiRz+Ojd5B6LcsHSho9KCJgnMpW8Y2twfWvKKHjz2T0nVhjoS8epnEKi2mnohnuE2TqLGZw/UlIBVc2G3iCtYv7TbDOgcoUexXedIZvZZr4h0eitGXiZZ0UdwN03ejMNQkC3eWWOTaPoPhNFeaa2JqwuFZB+i4mYqC3IXCJuI8s07SLdEQYk9akCdnzJB+5rM+zceAShznIr95jyb5/e0DK9vHPuCwAbrc/PHKz6WgCgAliANywldvW+hQRxJ4Ep8Y/wGHj1uYvOjJv1RMHecQskFbTVJ+vQi/SPtqDAkQNz/2q/d2ljAEfNMLbRGK02E0DvLtlredgWQK8dLSXtZBYgndllQanby42roKNTU0w0Dk8q5cxYIk+z/wQIink8EP5vC/QCDQ2g5VRaosgiTi7sreJdWuOOIeTTClpPJYH63C1Rh36WIzTOBhUQlfLwXj5138Dm0gdBakO9MYRhlQwQtlfqZS1hUBfZJa+l2F3sJbH0I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8037.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1UwNG14aU5NTTYzcDNobmhjcnRuMHdmQk80WXZFbUo3TDJTd1VmazNKUTVv?=
 =?utf-8?B?bWk2ck5ra2pyL3FCSjFiZ3N2VTV6VHNmSUhsaDB1NTJvN3QrTS9oNU9LcjAy?=
 =?utf-8?B?K25JTXZzQUJXTjA1V2lrWkNHdnp5ZlVjcmtvMWlQT2tzNlZtWUV2R1BXeTVv?=
 =?utf-8?B?TE0zWmI3UXRHRVl4T2tpUUIwQk1kbDNPMnZhaDNzNmpEaUg0RkdWTEhER2tR?=
 =?utf-8?B?ZzNQdnEzb2hZaXhiSHBacFdEQ1d3UnNFeXJVQlkxSWs5Z2h4cEFiS245RzZI?=
 =?utf-8?B?SzFYc0J3djdPOE5JV0N5VnVvZTlaM3ZMYmFoWVV5cFV3R3JCdUtNWDJGL0xG?=
 =?utf-8?B?NnF4U29PR1hicFYxMGd4bUlCRFZLYkR2YkNpTTNielh4VXhpM09pM0dsanFB?=
 =?utf-8?B?Z2J4a0F3bTB5d3lOQ1MzQ0w5ZjRZNkNTNkJ3TU9CaHJpZTNwY3ZHaTZzc2w5?=
 =?utf-8?B?UlVkaUFVcFRBS2IxRTNjcmRXMHRFRDlkd1BublRBOWQwQmUwYXcwcHlWOTh0?=
 =?utf-8?B?aENySFZlTFFpOXV2b0txUVpyVGpkVjlybXRUaUpZQXNoYlUzTExjZEpJZlJ4?=
 =?utf-8?B?eVRoUDMvM29UTCtXV0hDNm5nQkxWMmlIZlVVcFY2WEtBQ01jNG1QRG1OODRL?=
 =?utf-8?B?cDNYTHhxS0NwdXVIN2t0RkIweGFqdkJkMHREV2FMWnlpYVdtVmtqQVJwT1g5?=
 =?utf-8?B?blp1N0FWZitoeVdTRWM4WloxdzZqRzJqV1pvSWFUVVRxa0QxcUFpdTRoMW1j?=
 =?utf-8?B?UU9xeG82U3dWb01KTnZSNElOTyt4SktTMGZzWXR5YlZYQlFzTFdIdnpWUXE1?=
 =?utf-8?B?SzNCTmhmV3NYQ2JrU2haOGRmb2RydDhtNHhEbXpPL3FWSVQ2RzJxOFpFaVR5?=
 =?utf-8?B?NGk2dWtLVGlhcnphcE44ajZqT3ZnK24vaUROUmpJMkdNSzd3QUJpb08wVUw0?=
 =?utf-8?B?cmhteGtvMlpnZTE0SXp4dDF0RUNjeE9IenZzbG9Xd052d2EyQ21zeU9SVDlv?=
 =?utf-8?B?OFZIZEVlQ051ZmUzRzRoWk5zKy9VMXRJbmZTMlZSZTNOOGRYUmNHdTdvNE94?=
 =?utf-8?B?N1pNbEtUcGZVcnZxZ1o2cVZmc09HOGpVcUNSdXYyT3V6K0k0eG1TWk9pNHFk?=
 =?utf-8?B?Vk9PSFdFekpvdU15c3ZlYkxwVjFJaHM3K2JyenhEYyt6U2V4Wnpyb0Z1bDRN?=
 =?utf-8?B?ZnJKa0p5UHpwa2FHdVNsdmN2b0tmU1E3MHg2OFFsVlRqckFHZ25XV0FZeGZ6?=
 =?utf-8?B?Z1IzcCtXR2pzcGRweVJRS0JnN0dwalRTMkVkWHRYU1RxdDhzN3hDczhuSDQr?=
 =?utf-8?B?MVNSRHJpdjN0TW1EbWEzdzR1NktNLytxOFl2TVF5V0paU2tHa2dkQzhNSjFs?=
 =?utf-8?B?K3FmaEV6cjIxTlEra3psTnVLMHlyb3ZPRElhWUsxdEJSU0t4MHpGOFFEWEZJ?=
 =?utf-8?B?eGU3OFEvRXcxYnJxL2d6enlYbFh1VEkxaVplcmszeGRielFyNHFXTzFPcTd0?=
 =?utf-8?B?OHN6ZHJBditWb0xZZytyNVhuZEVHWnozM1BBZFFZb2FETzkveE4vcmJpdXYy?=
 =?utf-8?B?MW9UN1lxdmJQczRYM296N3hvbURlM1hCTW1KcHFTVkd1NENFcXlBM3pQaGRD?=
 =?utf-8?B?Y0pwdDNvNFd4V2VUWEluOEVwZUVMNlRoSUg3cnU4ai9jMFhVRlhEeHJHNFhU?=
 =?utf-8?B?SDFZZlFwWVVKQ2xIaDh4bUNYTHhZYzZ1SmZrMHNpTmRITGU0d0IwaDZPNkQz?=
 =?utf-8?B?NUZYMjIzd09LbURPYlAyNVZnd2N2dVZSenFWRUExbEhLL2NlUzdyT2Joek52?=
 =?utf-8?B?dUpnTTBUUEMzaUFnQUJXazBKM2RlUzZ0MHJWSDZJVDNXcUxIWkMza04vY2R6?=
 =?utf-8?B?Q1F5WVdsd0JaeUk5aFZLUXdHclphb1BlMGlmMkxCUFFMcmZPako5N0lJUHJI?=
 =?utf-8?B?NmZoNjFLaFVreGFQbk93OGx0Wi9RV1VHb1A5VEpVNXkrNDFIWE4rRFJxYjF3?=
 =?utf-8?B?WTdkWVl4aU5yeXR0WW41VmlXeTNCdWZmOUVNd29RV1c0Q2NxZGpVdTRBbGJH?=
 =?utf-8?B?aGZGdmhPV1lrdXlyWndnVVR5aWNpZjdiZVVOL0UvaUwyWi9JeENGOUh3QXYz?=
 =?utf-8?B?YStFOGZwY3Y3QUJKdHRTK2FJeEFUWmpyOVJXSm90MUZ1UjhVcE5JQUR0S2ZF?=
 =?utf-8?Q?e1TTx4jEoZgHp+chcO/k1pk=3D?=
Content-ID: <44F5DB45FBEB0A47936BD4761B0F2EDB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: giUmW+90y+64o72uybY92BILr3jFQCfA5gWE/xZ+XygE+zM3Zu9qQOVasAhqvDGrevqjqkwEjiFtjNntmdph1zAh0BBMTjcWBJ+esgKPB52hMnW+E7juYfhopt0SN4T+9YaGJImy8yYikQrmOebxpm/3Ofc6MLpW2lAYVpsbl/PydQsT6dg2Qdv4Bh14uJxrc4+xNGMGLYPb+OQNb2ulSlOExy720wM9UIdhNBp2u8vNq1Gw6ike0G96sit3aer+KcB+GuLfX6g5cUShR+N7aQwMGiHjWb0T9GlcxU5SquVGRGKfJuI/9wpTIJUoD6PUUCK8eckg48D46033uYDVQSG+bTk729n1qGPBAqAtlM7Ehlpy4btCVK2TmOwQJYc06O21ywZVcD1UK3ZipkNBd4mp8pU4hgi1xlB8zEcxJZYtc2pnvOv6j6gJLCm+lBqZVPDkJGfSaDZgArUBSNfVcqtHdI1CNok4R7QkDKGjxpeiLxj7TvTF0Qs/Sg1YNpFhconfykwrn2cBrTKg2P3BewGOcII45CapUBX7knmOS5CwA9x1xe0obpjn6xTSBNYBTF1t2ETl2x9s9gaEx1k9exYWFyGWUzBvdAanrwUoOL+kd5ETU+rppsJxWdeC2nXn
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3429e415-fec0-4a4c-f1b1-08dc48033046
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 10:56:11.1498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1LoB4751VSn/GeJ6dEb4cc8apsi6pbxLlahufQmj2El7m8QCgmpSQrV59zmfRgH+Qz8BVH8KoubqpaOwNiZTd7JXT1hjEvRyFYXTecjGBc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR04MB8831
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mar 18, 2024 / 14:12, Daeho Jeong wrote: > On Sun, Mar
   17, 2024 at 10:49 PM Shinichiro Kawasaki via > Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
    wrote: > > > > I confirmed that the [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [216.71.153.141 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmX8i-0007KC-LH
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Shinichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Yi Zhang <yi.zhang@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTWFyIDE4LCAyMDI0IC8gMTQ6MTIsIERhZWhvIEplb25nIHdyb3RlOg0KPiBPbiBTdW4sIE1h
ciAxNywgMjAyNCBhdCAxMDo0OeKAr1BNIFNoaW5pY2hpcm8gS2F3YXNha2kgdmlhDQo+IExpbnV4
LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90
ZToNCj4gPg0KPiA+IEkgY29uZmlybWVkIHRoYXQgdGhlIHRyaWdnZXIgY29tbWl0IGlzIGRiZjhl
NjNmNDhhZiBhcyBZaSByZXBvcnRlZC4gSSB0b29rIGENCj4gPiBsb29rIGluIHRoZSBjb21taXQs
IGJ1dCBpdCBsb29rcyBmaW5lIHRvIG1lLiBTbyBJIHRob3VnaHQgdGhlIGNhdXNlIGlzIG5vdA0K
PiA+IGluIHRoZSBjb21taXQgZGlmZi4NCj4gPg0KPiA+IEkgZm91bmQgdGhlIFdBUk4gaXMgcHJp
bnRlZCB3aGVuIHRoZSBmMmZzIGlzIHNldCB1cCB3aXRoIG11bHRpcGxlIGRldmljZXMsDQo+ID4g
YW5kIHJlYWQgcmVxdWVzdHMgYXJlIG1hcHBlZCB0byB0aGUgdmVyeSBmaXJzdCBibG9jayBvZiB0
aGUgc2Vjb25kIGRldmljZSBpbiB0aGUNCj4gPiBkaXJlY3QgcmVhZCBwYXRoLiBJbiB0aGlzIGNh
c2UsIGYyZnNfbWFwX2Jsb2NrcygpIGFuZCBmMmZzX21hcF9ibG9ja3NfY2FjaGVkKCkNCj4gPiBt
b2RpZnkgbWFwLT5tX3BibGsgYXMgdGhlIHBoeXNpY2FsIGJsb2NrIGFkZHJlc3MgZnJvbSBlYWNo
IGJsb2NrIGRldmljZS4gSXQNCj4gPiBiZWNvbWVzIHplcm8gd2hlbiBpdCBpcyBtYXBwZWQgdG8g
dGhlIGZpcnN0IGJsb2NrIG9mIHRoZSBkZXZpY2UuIEhvd2V2ZXIsDQo+ID4gZjJmc19pb21hcF9i
ZWdpbigpIGFzc3VtZXMgdGhhdCBtYXAtPm1fcGJsayBpcyB0aGUgcGh5c2ljYWwgYmxvY2sgYWRk
cmVzcyBvZiB0aGUNCj4gPiB3aG9sZSBmMmZzLCBhY3Jvc3MgdGhlIGFsbCBibG9jayBkZXZpY2Vz
LiBJdCBjb21wYXJlcyBtYXAtPm1fcGJsayBhZ2FpbnN0DQo+ID4gTlVMTF9BRERSID09IDAsIHRo
ZW4gZ28gaW50byB0aGUgdW5leHBlY3RlZCBicmFuY2ggYW5kIHNldHMgdGhlIGludmFsaWQNCj4g
PiBpb21hcC0+bGVuZ3RoLiBUaGUgV0FSTiBjYXRjaGVzIHRoZSBpbnZhbGlkIGlvbWFwLT5sZW5n
dGguDQo+ID4NCj4gPiBUaGlzIFdBUk4gaXMgcHJpbnRlZCBldmVuIGZvciBub24tem9uZWQgYmxv
Y2sgZGV2aWNlcywgYnkgZm9sbG93aW5nIHN0ZXBzLg0KPiA+DQo+ID4gIC0gQ3JlYXRlIHR3byAo
bm9uLXpvbmVkKSBudWxsX2JsayBkZXZpY2VzIG1lbW9yeSBiYWNrZWQgd2l0aCAxMjhNQiBzaXpl
IGVhY2g6DQo+ID4gICAgbnVsbGIwIGFuZCBudWxsYjEuDQo+ID4gICMgbWtmcy5mMmZzIC9kZXYv
bnVsbGIwIC1jIC9kZXYvbnVsbGIxDQo+ID4gICMgbW91bnQgLXQgZjJmcyAvZGV2L251bGxiMCAi
JHttb3VudF9kaXJ9Ig0KPiA+ICAjIGRkIGlmPS9kZXYvemVybyBvZj0iJHttb3VudF9kaXJ9L3Rl
c3QuZGF0IiBicz0xTSBjb3VudD0xOTINCj4gPiAgIyBkZCBpZj0iJHttb3VudF9kaXJ9L3Rlc3Qu
ZGF0IiBvZj0vZGV2L251bGwgYnM9MU0gY291bnQ9MTkyIGlmbGFnPWRpcmVjdA0KPiA+DQo+ID4g
SSBjcmVhdGVkIGEgZml4IGNhbmRpZGF0ZSBwYXRjaCBbMV0uIEl0IG1vZGlmaWVzIGYyZnNfaW9t
YXBfYmVnaW4oKSB0byBoYW5kbGUNCj4gPiBtYXAtPm1fcGJsayBhcyB0aGUgcGh5c2ljYWwgYmxv
Y2sgYWRkcmVzcyBmcm9tIGVhY2ggZGV2aWNlIHN0YXJ0LCBub3QgdGhlDQo+ID4gYWRkcmVzcyBv
ZiB3aG9sZSBmMmZzLiBJIGNvbmZpcm1lZCBpdCBhdm9pZHMgdGhlIFdBUk4uDQo+ID4NCj4gPiBC
dXQgSSdtIG5vdCBzbyBzdXJlIGlmIHRoZSBmaXggaXMgZ29vZCBlbm91Z2guIG1hcC0+bV9wYmxr
IGhhcyBkdWFsIG1lYW5pbmdzLg0KPiA+IFNvbWV0aW1lcyBpdCBob2xkcyB0aGUgcGh5c2ljYWwg
YmxvY2sgYWRkcmVzcyBvZiBlYWNoIGRldmljZSwgYW5kIHNvbWV0aW1lcw0KPiA+IHRoZSBhZGRy
ZXNzIG9mIHRoZSB3aG9sZSBmMmZzLiBJJ20gbm90IHN1cmUgd2hhdCBpcyB0aGUgY29uZGl0aW9u
IGZvcg0KPiA+IG1hcC0+bV9wYmxrIHRvIGhhdmUgd2hpY2ggbWVhbmluZy4gSSBndWVzcyBGMkZT
X0dFVF9CTE9DS19ESU8gZmxhZyBpcyB0aGUNCj4gPiBjb25kaXRpb24sIGJ1dCBmMmZzX21hcF9i
bG9ja3NfY2FjaGVkKCkgZG9lcyBub3QgZW5zdXJlIGl0Lg0KPiA+DQo+ID4gQWxzbywgSSBub3Rp
Y2VkIHRoYXQgbWFwLT5tX3BibGsgaXMgcmVmZXJyZWQgdG8gaW4gb3RoZXIgZnVuY3Rpb25zIGJl
bG93LCBhbmQNCj4gPiBub3Qgc3VyZSBpZiB0aGV5IG5lZWQgdGhlIHNpbWlsYXIgY2hhbmdlIGFz
IEkgZGlkIGZvciBmMmZzX2lvbWFwX2JlZ2luKCkuDQo+ID4NCj4gPiAgIGYyZnNfZmllbWFwKCkN
Cj4gPiAgIGYyZnNfcmVhZF9zaW5nbGVfcGFnZSgpDQo+ID4gICBmMmZzX2JtYXAoKQ0KPiA+ICAg
Y2hlY2tfc3dhcF9hY3RpdmF0ZSgpDQo+ID4NCj4gPiBJIHdvdWxkIGxpa2UgdG8gaGVhciBhZHZp
Y2VzIGZyb20gZjJmcyBleHBlcnRzIGZvciB0aGUgZml4Lg0KPiA+DQo+ID4NCj4gPiBbMV0NCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jDQo+ID4g
aW5kZXggMjZlMzE3Njk2YjMzLi41MjMyMjIzYTY5ZTUgMTAwNjQ0DQo+ID4gLS0tIGEvZnMvZjJm
cy9kYXRhLmMNCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYw0KPiA+IEBAIC0xNTY5LDYgKzE1Njks
NyBAQCBzdGF0aWMgYm9vbCBmMmZzX21hcF9ibG9ja3NfY2FjaGVkKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsDQo+ID4gICAgICAgICAgICAgICAgIGludCBiaWR4ID0gZjJmc190YXJnZXRfZGV2aWNlX2lu
ZGV4KHNiaSwgbWFwLT5tX3BibGspOw0KPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19k
ZXZfaW5mbyAqZGV2ID0gJnNiaS0+ZGV2c1tiaWR4XTsNCj4gPg0KPiA+ICsgICAgICAgICAgICAg
ICBtYXAtPm1fbXVsdGlkZXZfZGlvID0gdHJ1ZTsNCj4gPiAgICAgICAgICAgICAgICAgbWFwLT5t
X2JkZXYgPSBkZXYtPmJkZXY7DQo+ID4gICAgICAgICAgICAgICAgIG1hcC0+bV9wYmxrIC09IGRl
di0+c3RhcnRfYmxrOw0KPiA+ICAgICAgICAgICAgICAgICBtYXAtPm1fbGVuID0gbWluKG1hcC0+
bV9sZW4sIGRldi0+ZW5kX2JsayArIDEgLSBtYXAtPm1fcGJsayk7DQo+ID4gQEAgLTQyMTEsOSAr
NDIxMiwxMSBAQCBzdGF0aWMgaW50IGYyZnNfaW9tYXBfYmVnaW4oc3RydWN0IGlub2RlICppbm9k
ZSwgbG9mZl90IG9mZnNldCwgbG9mZl90IGxlbmd0aCwNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzLCBzdHJ1Y3QgaW9tYXAgKmlvbWFwLA0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW9tYXAgKnNyY21hcCkNCj4gPiAgew0K
PiA+ICsgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsN
Cj4gPiAgICAgICAgIHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgbWFwID0ge307DQo+ID4gICAgICAg
ICBwZ29mZl90IG5leHRfcGdvZnMgPSAwOw0KPiA+IC0gICAgICAgaW50IGVycjsNCj4gPiArICAg
ICAgIGJsb2NrX3QgcGJsazsNCj4gPiArICAgICAgIGludCBlcnIsIGk7DQo+ID4NCj4gPiAgICAg
ICAgIG1hcC5tX2xibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBvZmZzZXQpOw0KPiA+ICAgICAg
ICAgbWFwLm1fbGVuID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgb2Zmc2V0ICsgbGVuZ3RoIC0gMSkg
LSBtYXAubV9sYmxrICsgMTsNCj4gPiBAQCAtNDIzOSwxMiArNDI0MiwxNyBAQCBzdGF0aWMgaW50
IGYyZnNfaW9tYXBfYmVnaW4oc3RydWN0IGlub2RlICppbm9kZSwgbG9mZl90IG9mZnNldCwgbG9m
Zl90IGxlbmd0aCwNCj4gPiAgICAgICAgICAqIFdlIHNob3VsZCBuZXZlciBzZWUgZGVsYWxsb2Mg
b3IgY29tcHJlc3NlZCBleHRlbnRzIGhlcmUgYmFzZWQgb24NCj4gPiAgICAgICAgICAqIHByaW9y
IGZsdXNoaW5nIGFuZCBjaGVja3MuDQo+ID4gICAgICAgICAgKi8NCj4gPiAtICAgICAgIGlmIChX
QVJOX09OX09OQ0UobWFwLm1fcGJsayA9PSBORVdfQUREUikpDQo+ID4gKyAgICAgICBwYmxrID0g
bWFwLm1fcGJsazsNCj4gPiArICAgICAgIGlmIChtYXAubV9tdWx0aWRldl9kaW8gJiYgbWFwLm1f
ZmxhZ3MgJiBGMkZTX01BUF9NQVBQRUQpDQo+ID4gKyAgICAgICAgICAgICAgIGZvciAoaSA9IDA7
IGkgPCBzYmktPnNfbmRldnM7IGkrKykNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
RkRFVihpKS5iZGV2ID09IG1hcC5tX2JkZXYpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYmxrICs9IEZERVYoaSkuc3RhcnRfYmxrOw0KPiA+ICsgICAgICAgaWYgKFdBUk5f
T05fT05DRShwYmxrID09IE5FV19BRERSKSkNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+ID4gLSAgICAgICBpZiAoV0FSTl9PTl9PTkNFKG1hcC5tX3BibGsgPT0gQ09NUFJF
U1NfQUREUikpDQo+ID4gKyAgICAgICBpZiAoV0FSTl9PTl9PTkNFKHBibGsgPT0gQ09NUFJFU1Nf
QUREUikpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+DQo+ID4gLSAg
ICAgICBpZiAobWFwLm1fcGJsayAhPSBOVUxMX0FERFIpIHsNCj4gPiArICAgICAgIGlmIChwYmxr
ICE9IE5VTExfQUREUikgew0KPiANCj4gSSBmZWVsIGxpa2Ugd2Ugc2hvdWxkIGNoZWNrIG9ubHkg
d2hldGhlciB0aGUgYmxvY2sgaXMgcmVhbGx5IG1hcHBlZCBvcg0KPiBub3QgYnkgY2hlY2tpbmcg
RjJGU19NQVBfTUFQUEVEIGZpZWxkIHdpdGhvdXQgY2hhbmdpbmcgdGhlIHBibGssIHNpbmNlDQo+
ICIwIiBwYmxrIGZvciB0aGUgc2Vjb25kYXJ5IGRldmljZSBzaG91bGQgcmVtYWluIDAgaWYgaXQn
cyB0aGUgY29ycmVjdA0KPiB2YWx1ZS4NCg0KTXkgaW50ZW50IHdhcyB0byBrZWVwIHRoZSBwaHlz
aWNhbCBibG9jayBhZGRyZXNzIGZyb20gdGhlIHNlY29uZGFyeSBkZXZpY2UNCnN0YXJ0IGluIG1h
cC5tX3BibGsuIFNvICIwIiBmb3IgdGhlIHNlY29uZGVhcnkgZGV2aWNlIGlzIGtlcHQgaW4gbWFw
Lm1fcGJsay4NCg0KSGF2aW5nIHNhaWQgdGhhdCwgSSdtIG5vdCBzdXJlIHRoYXQgdGhpcyBtb2Rp
ZmljYXRpb24gY292ZXJzIGFsbCBjb25kaXRpb25zLg0KSSB0aGluayB5b3VyIGNvbW1lbnQgYWJv
dmUgaXMgc2ltaWxhciBhcyBDaGFvJ3MgY29tbWVudC4gV2lsbCByZXNwb25kIHRvIGl0Lg0KDQo+
IA0KPiA+ICAgICAgICAgICAgICAgICBpb21hcC0+bGVuZ3RoID0gYmxrc190b19ieXRlcyhpbm9k
ZSwgbWFwLm1fbGVuKTsNCj4gPiAgICAgICAgICAgICAgICAgaW9tYXAtPnR5cGUgPSBJT01BUF9N
QVBQRUQ7DQo+ID4gICAgICAgICAgICAgICAgIGlvbWFwLT5mbGFncyB8PSBJT01BUF9GX01FUkdF
RDsNCj4gPg0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
