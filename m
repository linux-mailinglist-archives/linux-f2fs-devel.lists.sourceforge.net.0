Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2aLpJvMItGlDgAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 13:54:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8BB283488
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 13:54:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3yHAPYSJ1ubc/r8XZ6Wn3vXZLt8RcjL7GZhlKr/fdE=; b=AcJhEA8Y1SZB2NiSNzJVRLsNxk
	nhN8J0YEVBaiJ9J2Hf8uAMNQe7E0QqtAy4Pk6WC0xDn2qg8Txpl8Mksqo9ylZ97DalnqgubmbU2Yc
	Jo5WyzO8luE0g8D9fhlDP1Wlj01cAyLINFD7pS0opFTQqETGEC/j76C+sPL8yGaWRjQk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w121f-0005JX-K4;
	Fri, 13 Mar 2026 12:53:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=525b55839=shinichiro.kawasaki@wdc.com>)
 id 1w121e-0005JQ-BP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 12:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P4Wp8VB6ZOV9c2OJV4mWXvHeKny6mJytYSljZVRyVtM=; b=bFOrbcK2mmWiC/fmSjaeQ1ShmM
 gZ+gnjDy37twvVit1o2akio0PG4VMkaTDls9SKHVcykGAvtcdYI4q+94k/b7G/MxxUZZTnW6a4hXQ
 aA9OYGpeste0Lg1TS6ZjIjjlaZy7BNYA9T9Lsdiu80YVkYtRM0v4QzSuEMPsXUQ1spwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P4Wp8VB6ZOV9c2OJV4mWXvHeKny6mJytYSljZVRyVtM=; b=JoDM2StmcZYUoakw5B7VNWiki7
 ngdI5CTA6vbi374wmtU67sErL77Hh6loIWVYDsSFWnGubbPnOekxmPRnduSOn5i0eSuknty4lBHpB
 RAiSqNBDrE/Kp5tV5WDIow8bGW2DQ+MF0+GE+Dbzzz1ycstfr53leJxomVCNO2RWhmE0=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w121d-0004Ep-Rs for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 12:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1773406437; x=1804942437;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OSRxUttEMuUpdRQdoMv1fvVvc0SNAuAqgAS3jq9J3s8=;
 b=gwJfiCLEl7n9GrA/TDLe9bzRmUdmDcL9001jcbcfenCbaSV2gFvId7gu
 Qm09+qLHqOrCFBz35FSW0j4o9W/SoxzaraA81B5jNwKU70Lw569z2jD2c
 1Ynohmt0ZEaZSZ0fSs/+LmAAy1UGzudWq20FNHcAhrcZ9jJoGs2PDh5Ee
 LWx9Ycgsa8KKjSntzkKxtsSg2WzgLOuGQPXU8xZOsBHiqfwaFHICCYOcS
 rQ4hyrYNKOidgmz+oCXEI7xUbX2izHzTyEpgh2/us446jINcRxFjN6tLw
 UNoR+JvZw+qOQf/r76enw92yTd1OTyFufzATWhZ8YkeMkydKNc2PvyGaX g==;
X-CSE-ConnectionGUID: V0RKry+2TAmeXIgv/5I90g==
X-CSE-MsgGUID: QNkeXV7pRV6EcJ5iQ3Y2PA==
X-IronPort-AV: E=Sophos;i="6.23,118,1770566400"; d="scan'208";a="143604291"
Received: from mail-northcentralusazon11010011.outbound.protection.outlook.com
 (HELO CH1PR05CU001.outbound.protection.outlook.com) ([52.101.193.11])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2026 20:53:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iV374MaPmUZQ7jDcohIGF9j5CM7yVsc/sid/jyzeAvaeItS88VVaRbX4ejL4+RgvKNZlFVr7JMmYxXiPmvz7Cc6XG3T5WU6WuGgo0ZmpMSMXSjg6zy4xBYr1r6GYRPj1cdeIRa6N5Xhb+Sm01l9Re2wQJf6if1vuo4x4PVqe/F1Vskg0icEtqYJESgQh/Xj22hUA/nK6N0HqaCOLQBb1el1ivw/L044334leMz6pusHCyCmkOZZsLDh/FBx+KiF1s68z5bhLUCeEjojiyqTToe3VXdAklfRHpb9CArbkA1sRgrhI2vzu3mho61tPVEfM/nt1V0WQX/IyVZ7aNFh1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4Wp8VB6ZOV9c2OJV4mWXvHeKny6mJytYSljZVRyVtM=;
 b=etByHNaRh6glFMPXCoPYjByUclor3vnobOOjwWFkn5mJC1/WszKjK7HMq6ciL7YVvjqNWZXwlAWkXXa/sjIsNtCSup0bCstik4lbmnzCOuQwx/vNXjiF+IGWIMRT6olHnb7LXy1JdgOMumU8PjNTo+OgMQNiitUZU45aVSWm5PVo0gnhvAsfi32d5uIImQZ3ywMO/+tjxSu3vNqrQFs/55xp7PJnd8Iro25/WvsWAPZfFok05SshJhdN8a38ILjoxSjjjwfuzPIuihEccpNBs4sX8WY8D+qd4wK16fjKn7pwM4OAh01eTwizS7aWP01QcEMClVnG0/NbQ6kL7weHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4Wp8VB6ZOV9c2OJV4mWXvHeKny6mJytYSljZVRyVtM=;
 b=O+N+5IeHZqAFtcJKnk2wm2RzVyj5lkH+n4IIsFfzF7lDMwlU/V6NHhqVF8J2PnSE6xIYj6/KgS9ZhUphVpn33XyDGvEclNOiW6JFBGNGqxct0P2mkNVdEcT07mYvo62feg2px1dmpNua/a0HfvJ4Kytd93bLNbkNzwbmR0NynzU=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
 by BN0PR04MB8061.namprd04.prod.outlook.com (2603:10b6:408:15c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 12:53:42 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729]) by SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 12:53:44 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
Thread-Topic: [PATCH 0/4] simple bio cleanups
Thread-Index: AQHcsuhsoJvODmFvWUyW0LwJxHdHcg==
Date: Fri, 13 Mar 2026 12:53:43 +0000
Message-ID: <abQHNzJ0FR1EF0NX@shinmob>
References: <20260304190424.291743-1-agruenba@redhat.com>
In-Reply-To: <20260304190424.291743-1-agruenba@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|BN0PR04MB8061:EE_
x-ms-office365-filtering-correlation-id: 35011969-5713-4a72-d719-08de80ff8f32
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|19092799006|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 33/Jw8w7AJ/NIiTIGhTuIG+TPZNmZUow0R1374sWUl1Xicc+KcIIBCZm/vNJlDE+S5cySLNTpm1bCuZS1TUNmLItwIoJn4Zee1NRFPI8CwAD50ykSYp28BD1fjApWtWefkyr03ciqs4QQqsOThCWCqQvYipPp/K7F9wfdPR9tQTqkV63KQGtE42hLHUDAlxaW+QqGLL+FcYPaExpTcQfmmVfoB8AWUZbTOPFGs1zaV3N/q072C1XU4EGhte+AjLpk/mURqc4OWQqKCrfGbStIbimhmimnHk2vL9pB3Z1fv1z77K57nnvZEsmHQPf1911kOfXb2C0Qj4pLGcQPxXwm2gTTqYBYvrrAol3BRKpi+/8TmiB/NesBASlkbPZldacrHHwvDg/WcTnvLJo8IrsbEWUlbhGLuoMD0zjwOPEbxufcPtd+tYyI7fPlB87uQTbPMiaebmKGbtcFRpSqGIf3PMbcJZpvyYzw36MS1KNzfqZONJyENBBsvYayGevrfwmm7FONlHXU8gogQjUiMvkGyc+adtV443icAFc3iT3XCp0lPyPhgj8bvpBnigrKOCTFkqA6p+p3lgISXvbGtpc0fnlixFbTlYJSg+m7YVKH1SSfn3CejHrBxLcm5juY9g3h9jM0zbW/de97oW9YfZj8zZI0dnifExQ+XYp3Smjlr7uw5H9cHRWnEbfrtn4FYs4m8TKxUdIxShHgE1sTqTOdO9KzwBnAA9d02xiTMht1/6wyXBoSSq5wFSzIE2orMqhOGF5WT65S0sSRbF+LIScMtfCYbm1lUsQFtru9e06QRk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR04MB8532.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OmT9HW1si4ppo+MmnO1pFgvFHa/1UGQJfE2reai+YNsxmOGDUnZ+0DYIo6xT?=
 =?us-ascii?Q?vwyirICyrnfQiMNGxw9MiJqR23sT1Wj1dpgoiBU4MVlN3+vA1/o4qAibqqOA?=
 =?us-ascii?Q?t04jYnUne3/O7Wh9NiNqkasPk7x9aQ31yLdghtpNJGUxfJDWJ3BUmGf0WHkr?=
 =?us-ascii?Q?idI3KQalNnTeuYlLkhf3gyrkPDD0vUBf6ZHfn9OsnbKTuEyu+CeKs6qy/g/A?=
 =?us-ascii?Q?rI3hRt0iri4ySQsDKxu5hVaORSGZBVwgvZwXRv6eyVXZVXBeFprHqT/n7pbg?=
 =?us-ascii?Q?K7Yga+EbmyI1CSoTHKk9aYl9b+nwtFBAG4Tnt8+FEISCODooKuMW5rHhwpWW?=
 =?us-ascii?Q?1pgSEMiFz5ftWytMygq8+tBjFg92k6bR/FiKsK4VsvY06M9PHgA4CscVmf1l?=
 =?us-ascii?Q?ef8HJLS7HCIrrebYcYWVIXk1jbQ3SHGz1+wQ4w13Br3mK5/6TPrZhoAg89Yf?=
 =?us-ascii?Q?9QzdcvH32a2NOkUrRj2qcr3cMhDSsvWEGwlXno72KSIDES5KBYS2angN1RcI?=
 =?us-ascii?Q?ruRV/1Or3aiZIRXYRzjYUhV9eYUzgY5iOzdFNKYK/QL4Tcced+qOqH6wo7uI?=
 =?us-ascii?Q?Hji6jeVEY6lcg5uUWqpwMBhLZb7kNC1kkCS6I8YGtzJZs3Dqm3N5hHdhBe5s?=
 =?us-ascii?Q?buIbvtPN/UwtShOj8u2wV5cRNv4GSkpDCvt7wbC5MnXZHxeRhdfnefyy2rjC?=
 =?us-ascii?Q?2hhc99nmTKc6hK1Qotyurh/WEZ5Gca33RLDuBNj/vNNvFVxBy6N/L5B0fOSc?=
 =?us-ascii?Q?DMsKzvfYyNGh5Ksbkbe+FIXGKwK/GgrP6Y1pGV2KpWXvCrA1SiAXutPXi095?=
 =?us-ascii?Q?+hvey8HfL+elVYLh4ZZOGuwq4auKY90ArWNnE+ABye4zlWAdW4RstZnbUP/u?=
 =?us-ascii?Q?Ps8LQPaTKjxCHp+v0byEOaSVE6Injg5fWCeBkoLh5/3bLT2yz8l/ix7l1s1W?=
 =?us-ascii?Q?gpZGT2Oct+MO3r08gC8w2KMAOiFXos6RxMFhoBQbfC7jpzDia8wRzUJJVnAL?=
 =?us-ascii?Q?UEebf2UOjZmUCF2Fq16tiC++7zXa0n7fUU9O4AMsJ0aewCatQ26owD1bwhnI?=
 =?us-ascii?Q?ohYxjU/iIcILl9xOr7LnWjGq5OA780ZgvPeoicZkkSWX/SQL4Scd4LXf/ClA?=
 =?us-ascii?Q?+HsPZeW4QevR1caI6+UUnifaOYHgMxpPZhdIkGoBzRGVcpTZD9352fNlUGet?=
 =?us-ascii?Q?PndJl3D/DW/dkinA6LRRjjp2aDPZQBF+rH2o6wbnjeZdUkHh4RKveLWKxF3f?=
 =?us-ascii?Q?7LYaRjlCpVHoF8UTjr7U34nCvvoaVMBpsTuYCG19O7NC3FLVn6Kk+A88DAZu?=
 =?us-ascii?Q?M5nVA1p3NOCH7jJXZy6V7qqU8yQn4sRwjJ0I2xUxw+9TMB5rv3aepzO/JuOh?=
 =?us-ascii?Q?yEx5g1v0/JZ/AfkoKhiUTCE3U6Q91BR0/o7YhYWGFF5GMJGHG7ukkm62d/Va?=
 =?us-ascii?Q?41GZ/FJYMdKNzL5kY1NbW4CSGGLeTv3hs6NWvYjeLhJYJeovsDsnU8S1h8s5?=
 =?us-ascii?Q?zWxAOtIIJxlWUhFriDwNk9oyzaIek4FuE8UO2CZ2Y+SQR+5R65OZmCJO07JT?=
 =?us-ascii?Q?uH3NgEvB0NtXG3UGrCgpRbcno6AZZCl5CfeCPAqvQHgN//C1GD01cG9VCLMB?=
 =?us-ascii?Q?Yf6+CLKj6IXv6mcnnkLxlUqCc8v2raTXxiopvbWfpUK0Mplp+3u6cO2F958f?=
 =?us-ascii?Q?Tb/f3OVNeouGF5twHuRlASd6RhU+SVOEbNzW+Avs85wJXp32YHupe0Cm466M?=
 =?us-ascii?Q?QbCaN0wwddoR1iX1IpUj+SyJ/sc92GU=3D?=
Content-ID: <04660C2DADAC4542B63210B46696291C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YMDbipa23e0SEK6sBNA38ZThVz/LzADS1lwEyYN491T/gK4LjElqfZzwA7Pb+cJ8tu7jqGRqaQRABMEIq8exUaunoOfBi/ILPpweJyRI7rClBRvxmbimAnEDaI7R7B9Zup5BiGj1KUKs9QVAj8F9h49MjVcnK+NIQS21DATIwjvH4TmmTO5Dj9BP4OnKJbwd9MutzLYnoY+lANp2VLmJ0I6f4Z+Irhakavn0wRDdWgW/CeQcgaTwdkJOrFxGw9rzFCwPfOyKSgJ5JFpgmGJh/9k6d9pbZ5petYjc6uKAzljrQHlgXfyw8xxoM6TrjR2qeYkzl/J0GDUzE2qER4TjOQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9J81tR7Ih9aVdFJHSqFLByzGz9xkxLC+R2gifdendXqa+TDfdUZEvLqwcjm8nREetNVx2w5pijjl4+OceHOg3JqwZsMjY9emPX7gldNPYX7IQ+5XoQDakT/OPZXxNzObtGegCP6x9//A95qlhOSM6c7/57hGZykY5al+YXfgIHv7jMYKDAUs+g/zzqLWCGIpL9Ijop2EX7H9iGZ0uebyG4gjSyHQvVleqtdRonsIWpZHguXDazZK+zAieqyPlehfbYFzAp/PcPSfVgeQxUc2SpuFVo64ZUiNPjTOLWNfUsVt9RkeeP0w9UhHxoBLTKFhEOCRDE9RyutLJJ1NUCT2zWNq425pbMp+ZsCvJk9YxuKyzCDf5hlT7otj6qir5bhPIztwU8nTRPKzM2NhQEEqLzSdbRZEKdacpTFoZI6CfdRUetC90adhZvk9+FaUIg4YcivTUIwxc46ywed2flWZhIoPfbsD8OXoskbGUOcG6CriZgGNOo+W9YKYUUHoga6jzFUa7NNFZ99P5jwEN3QjpBo2CkjUDHzHuuTCF7f00zAF9xx5YXweSKcaf8IZlUAW3kgwwNFp5nxfGDgG5TbVVV8NenHVxe4z7LuanjpJeu8FSKa3McawIQz+S45cYupO
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35011969-5713-4a72-d719-08de80ff8f32
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 12:53:44.0239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wttaWsSFM2hmm3SW43PZrMEnNsh6Kzcv0vrRmC2F8yvBtHptSJMVvA9nO21sShCT5Q7rGanukvMzyJawKgswYMoc9aT+3ccF2yPvoW9t8hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB8061
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mar 04, 2026 / 20:04, Andreas Gruenbacher wrote: > Jens, 
 > > here are some simple bio related cleanups. Any thoughts? Can those go
 > in via your tree? > > Thanks, > Andreas > > Andreas Gruenbacher [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1w121d-0004Ep-Rs
Subject: Re: [f2fs-dev] [PATCH 0/4] simple bio cleanups
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,wdc.com:s=dkim.wdc.com,sharedspace.onmicrosoft.com:s=selector2-sharedspace-onmicrosoft-com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,wdc.com:-,sharedspace.onmicrosoft.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[shinichiro.kawasaki@wdc.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wdc.com:replyto,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: BA8BB283488
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mar 04, 2026 / 20:04, Andreas Gruenbacher wrote:
> Jens,
> 
> here are some simple bio related cleanups.  Any thoughts?  Can those go
> in via your tree?
> 
> Thanks,
> Andreas
> 
> Andreas Gruenbacher (4):
>   block: consecutive blk_status_t error codes
>   block: get rid of blk_status_to_{errno,str} inconsistency
>   bio: rename bio_chain arguments
>   bio: use bio_io_error more often

Hello Andreas, during blktests CI trial runs, I noticed that this patch series
triggered failures of three blktests test cases: scsi/004, scsi/007 and
throtl/004. Do you see which patch triggered these failures?


scsi/004 (ensure repeated TASK SET FULL results in EIO on timing out command) [failed]
    runtime    ...  3.855s
    --- tests/scsi/004.out	2026-03-12 15:23:54.664435639 +0000
    +++ /home/fedora/blktests/results/nodev/scsi/004.out.bad	2026-03-12 18:13:40.059747989 +0000
    @@ -1,3 +1,2 @@
     Running scsi/004
    -Input/output error
     Test complete

scsi/007 (Trigger the SCSI error handler)                    [failed]
    runtime    ...  115.385s
    --- tests/scsi/007.out	2026-03-12 15:23:54.668435644 +0000
    +++ /home/fedora/blktests/results/nodev/scsi/007.out.bad	2026-03-12 18:15:55.054944537 +0000
    @@ -1,3 +1,3 @@
     Running scsi/007
    -Reading from scsi_debug failed
    +Reading from scsi_debug succeeded
     Test complete

throtl/004 (nullb) (delete disk while IO is throttled)       [failed]
    runtime    ...  1.643s
    --- tests/throtl/004.out	2026-03-12 15:23:54.710435695 +0000
    +++ /home/fedora/blktests/results/nodev_nullb/throtl/004.out.bad	2026-03-12 18:20:46.314368581 +0000
    @@ -1,3 +1,2 @@
     Running throtl/004
    -Input/output error
     Test complete

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
