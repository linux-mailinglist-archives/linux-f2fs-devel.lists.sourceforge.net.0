Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOAUEte7p2nfjQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 05:57:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9651FACBF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 05:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6thbvrSu5zZW1sOTQNnNIr0wkZGwudC0LWgqUWhmx4=; b=aECC8QhyXVdthDte79hyieaGqO
	YcWrSsXP8hWOPU08BZ4kt+iybIW2J5S92tSnwU9Ja/4jD7xTEkACzDei427OGDhGMVsN9LmIrw3OM
	gShEblKjO1YGtx54cbnIS17lcx4YIRtXZ955QBfaVXJN3VHnC4soWAM3swMaDNQVGzy4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxeIq-00032d-Nf;
	Wed, 04 Mar 2026 04:57:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=5166cf246=shinichiro.kawasaki@wdc.com>)
 id 1vxeIe-00032N-Ua for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 04:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Lw1QKUS7qhGSIpOWky3s/+jnp0Qnn6HkTh8yXbZTnw=; b=Fag9X7LkR6Jm+PwiodSWPT8NHo
 RB4Qg2vUICtcQrq/TrMEW8OpTTc4UW2oLSEnUi4NLQYjFAnpUrmNQ+xXQsWWae24LsvgolcvJTYl2
 vPDZAjvf7Fk85qNNhXwS7fUNG9ScGufMW7ZWJHGSRAoZ2q/dDZzTpkTyoYqYVJmet29E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Lw1QKUS7qhGSIpOWky3s/+jnp0Qnn6HkTh8yXbZTnw=; b=lxMHPvgpvnUwmIFbHodIwLwD/v
 LRwbHK2WHcbqUsHvptur4ryawxrVXrPkiDi1AuUaDOd+x9H7Kfo8UV8X7m6Qx1/1hbrPIal5dvlds
 uq2CekR09uDOoghtVqfF4578jQcvGTUJ8IQ3dm6t6h71AzAn7zWEV/T2VMgcZeTfxqdU=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxeIe-0001CL-8K for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 04:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1772600252; x=1804136252;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=u/a7YKcz2iCdKlUeI5re+6AkmRHUlB3jaTfxHHw7u+U=;
 b=kneri3Bq5kiNjJwFEJRtEn6Dz84l1dfyGyKB2/cte6Y2iV1VDkoK1+qg
 8UxH+RLryYX6NnjZbcbr2KnlOOOLPOd3xYozBAM8eVg2mhMjQ+rLCdVrF
 l28IREPirRK9jin8m7fHfUT/MKuRYXyr1v2Y05yTy7aY0jdshOF+VWqX5
 R2GHjP+XdSuAHPaC0hmYZ+rWZY1dcOSNpGHHGRUgBAOkw3R7GXuGz6SZr
 PjO7BgZ1MeBzL1jzXAP3B7IlnKI9jq6EiyHt+uSBz2mrFHNW3ank4bhAf
 0zPYa0KhBdTcOXLWoR+hm1wzJK/Cd4m57qeNxd7ZkdXVXQlJMmKsiifpI A==;
X-CSE-ConnectionGUID: 5ZndwH/3TJKx4WNats9Qcw==
X-CSE-MsgGUID: n4qTmQhjTHmS018/bsZ2Cg==
X-IronPort-AV: E=Sophos;i="6.21,323,1763395200"; d="scan'208";a="141465706"
Received: from mail-westcentralusazon11010034.outbound.protection.outlook.com
 (HELO CY7PR03CU001.outbound.protection.outlook.com) ([40.93.198.34])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Mar 2026 12:57:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0puWhorbx1s12i47SvK/7/CoCIKEqgTnEUHeez8JDqIRr2z3mqYTVJyi82IWSt17bZkuFFH98GMGpAyft8MKE2eDw0ZWvYA1F30+RoI2OeAGrV1ZgiaDGmdcBzDx0ddm7ymOWN14ycCieCoJckFD/jjGyKtDm6ne6AFFX/kDs7nbzLwsgeJs3pRMVkSX1+ai7Pkx9bX6aXCMqYKOz6Ok+Sbi34qhjlqk+kc58YKWbcOaafBpbzLrLrixa4dq4+2A2fP1ueMVaQEOM/8MsfCv90VVbDvXmB6v/LyZRIZ1K8uBf0Rvl0Hqt+Etv85zAR++o2gWhQQ2te8bJvHXPxu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lw1QKUS7qhGSIpOWky3s/+jnp0Qnn6HkTh8yXbZTnw=;
 b=W+1VQjzoXITnqTrtYaQN6j8xqCirTnSuFPZH2v1VGdV9JRnRmDjinhju8SERnenFcnP6MBcbDc5bjGw1/AG74DlVJn2lAS93HiXsNPqEjrve1yLhYkJRzfJdK55ZZWVe+g82Ig4V1BMDyr5Kme9cW56F5+vvNV/JKoesSj4MlXGFmufozz5ayiY+WlkaTbIpteOPoxniQnKtl5bTFBgMdgdpFjk2KcUHB43x3gqmHiQlOX54zR1jRnJLwDJW0wQ4Pxq7bXytHzSvzft75IxkI5e/9Bbl9gCpmRkxswzSVrAJsFhpC5qiO/y/qZC02LeYbTuB8FEfFHKtvFj4LAPvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Lw1QKUS7qhGSIpOWky3s/+jnp0Qnn6HkTh8yXbZTnw=;
 b=a+2encM1nYe++EgkpTaRX0dAvco4qPyHgH/4SflJb9ILH+uV/f5+ydN9zSuUKXiI0yF+Fo/szODJJ82z892af0LeGz6Z+1CjNJY+vaYlcnwZ9UyEPoLt0PwqPhsEzjIBMFgbMiWRmYdOM15UWAUUDBI90YDlGZPZou1K5ypiD1g=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
 by BN8PR04MB6274.namprd04.prod.outlook.com (2603:10b6:408:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 04:57:19 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729]) by SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729%6]) with mapi id 15.20.9678.011; Wed, 4 Mar 2026
 04:57:19 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2 1/1] f2fs: fix lockdep WARN of sbi->cp_global_sem and
 q->q_usage_counter
Thread-Index: AQHcoNWEWBcPYygC7EirE0kirNCd/LWROPsAgAAzDYCABaKtAIAG1l+A
Date: Wed, 4 Mar 2026 04:57:18 +0000
Message-ID: <aae5x_9gpi7utuf0@shinmob>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
 <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
 <aZ0aVDSWpRRqFwl9@google.com> <aZ1C-Cdrwoxp0VCJ@shinmob>
 <aaH_XCGbYOt6dpba@google.com>
In-Reply-To: <aaH_XCGbYOt6dpba@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|BN8PR04MB6274:EE_
x-ms-office365-filtering-correlation-id: 3200fa60-2dc7-46af-7894-08de79aa8374
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|19092799006|1800799024|38070700021; 
x-microsoft-antispam-message-info: CaRf/RoU/NLiN/sefBElDmmDMtDPUTQEutCUkj5Nr62znvvUXuWVIwNSLmjhAqIj9PbtciITwXr0vKZ3uo3HvV2Cwj5fwi9zOP2EhBgF8KrJ+6uiaoMdPjs2c+QYWwCkbjc73wxymzvxY4g4Of6dyVEpm51BNYQOsREs9VG86n5GOFVvRZEB/fcyL5VEOubFEym8kJQ4aPGujUxYgeHp9cJhEQfG5sXt7oLcLqOyra+FneMbnqt94fPPZ5tHfiCrc/fDO7BwpfM6TdJqdeHhXB2UbEg4nbsbm0q4mJTfbWP4WaLQvKK/n6xMItl7dLf+jDHfpyeDCMrn8mGItTkzj3I/DTUpIbZ0YHjOuiaKWjTkDpDPdMu0Z6lJWXfupUHPByfYaOirX7mCpEe84rleeNrSUXhf6LcyUBzbW1ZrL+B1WhCttwUWl9jHNLyJ8uF/J1kXlijchn0N9AOgSv/tGGjNTVP3CpMNJYvApNEUVQwd2a6OMYLTfPp+EkJc+Uwmn0R2VXRYXpiUHe5nAWssrdaEgqv2y/DwJJlkM9SU+9eTOelC8CcDvc5maszycmPuIMhMBfxvKsAnq/rq/d/D8lJQ0qpFPWjrzcJa2Bbcw0lcho5WXNyOHV4nTaYPRyUH+jJCB5KwA+I05Dz7BBcpXK5jeuJn0FUrUmAonDr/lXgMKo1Cz19TKWiKqTbD2i5lZWrN4VMVndiL/32oPeLFa0qqQkGT8FRPe27lkfhhramQ/rrs1up1vt1u8SMXnv/T30OPo2G+KAgCXhqCVI6X3X1sD08yzB7WW536+9wX3YM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR04MB8532.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9G4Fp02CXoGNHn2hVux7oUZgG6mMGjDdw/aRVg+OLCCsW40l8lipT5pcT2LS?=
 =?us-ascii?Q?lJ5dJGXJJ5vGImJkWMjwFStg6z8HXCqJKWu3Vjqh+xbDz3fajZox90JxnWP3?=
 =?us-ascii?Q?LRlEpQ/+ckeAzipR7jHoVvQ3tYuJhhqTYmCR6tQGT05vYuUAf2v3xR7l0Sbs?=
 =?us-ascii?Q?D0sTWXFz+vRBnqKTbXi266+fu/pziv8aMy0P7MtsNlbR2w924NpBvQRJhlu2?=
 =?us-ascii?Q?c2AXcDJ3+xOGkak6PW0BDIDwwmg9bLl7EwHrJxf6l2+XNlqktYfiKtLHJK6L?=
 =?us-ascii?Q?2ZDno/4GgOFFgbAmZYaJyTt6EopEUIl1kg58Jyfd2mK2KF9ejwIM0fdTSwuu?=
 =?us-ascii?Q?4IzPlQqtlgfkLDplHorTilWZWpOSYHKpgWchG9q0uahQ+i2QnJ9e8bdBOTbp?=
 =?us-ascii?Q?6BVN4+HE2ZyOUeI4DxXI4ETHnQHJLgl+B83TL/gBVa4eqTY9PqGImu0CZ8lh?=
 =?us-ascii?Q?C9/bpKEYyB+OmqA0fSKuNYJmhKI37FC8qRV38r7wVdWQQTh60PkYBr0g7N2c?=
 =?us-ascii?Q?psgI/p/Eje3HOBP7uv6FDFFGizblRv/jafWGZHFxyG/7EcR8HLr6HhIS1r+j?=
 =?us-ascii?Q?vkiP/3WcvAvB0pjFDfdyqr251HMbd6FhvDP1KbNxtn+pFr29gngwVDXWnSMx?=
 =?us-ascii?Q?0i6i4eqp/EOuBed6U+VKCP1xMOaqKlmg8PB3ZQ8Dm+Kbg1qaKMnFnh3GWt4e?=
 =?us-ascii?Q?3GHv1/wsmdfC08bZ2/AUxzf8I/bmQfTWZGdS4s70OdiN2J0u5hszi486oDCo?=
 =?us-ascii?Q?RiHeVMrkIjXw8DOCSyz/k0MXyIFPYJf6l8J/wlABKiMROmrqfWZc9BgJWRQ5?=
 =?us-ascii?Q?NJy3YSQPjKhC5EDbU05Xo4/HbIzfRTAQ27z/WTA9fEemvoW18Wm0aRC6mNL0?=
 =?us-ascii?Q?vv6QzwQ3nVCDA89HYRi/f2n4C9GLQGdGbB1/v6r50pL62yEnn+TOLgqH28UG?=
 =?us-ascii?Q?QceBvq+o0aUd1/Zhs3wEaq76mzSDPHf5mRnkMCiHhY2L29z+FJJDcitdtE3A?=
 =?us-ascii?Q?HmMUBz9Avr7vaFY6RHYAXnZ7dwLpxtgkoY1IbK7J5OGdqN0iveqxopapQFfn?=
 =?us-ascii?Q?ewiDOnCKXFwXLioDK2r1cKq6q/XL7xQkmvNizXd1VShzKThoyljo1gccPum8?=
 =?us-ascii?Q?NrcwBoR1Ni/8fJXfO5PQCtTqjxjjyaioFLMgc48l9oI+pEdXfd2q41bHpdTk?=
 =?us-ascii?Q?uzlYlC8Rcm7MLk8RJ+W8mWVNSX2WvOuIDWOs+4uB/AvnSl1jIMSD4DIMnctS?=
 =?us-ascii?Q?1wQJ7Q6tB2Vuj9rDmNTeXGVrVs7gH5kAparriM6EkpohKSbMK9AObd6+Ssl+?=
 =?us-ascii?Q?Yjz5yHtjSyiIeioXUu4m/Lm63ky9XFmIWe8BAJsK8jKl7Ua3DLzNlogRSQdM?=
 =?us-ascii?Q?/0l7E1M82X0+VdSGp85mcBm2CFiA6M9ElJFGRyETMWvooPRWAiRBTmwvlEF4?=
 =?us-ascii?Q?3TDhUZP5BfHFewpfExqOih6a4oxMooDByJQ2tA5VSG6tOwy1zFOYUkzBWnho?=
 =?us-ascii?Q?4QRHkWElQvitTKF3ivh8TNBuisGOkWrIXKjMJ5OXw6aKh2384W47SBv+F0/P?=
 =?us-ascii?Q?J1fIKOtIT+CxEkyTtB7Nmnn0aFzmYTwITPFmyvGFM13K6OpqS+9KSc/9guum?=
 =?us-ascii?Q?yy+N5xaojapxjEHFDrgGACRQ030UIRVfaUyovusPmX/bqMQaCmPRDNnwP/36?=
 =?us-ascii?Q?AGaCxmcg8+O8/vDLDx3MGJoP6gDfKAAY1BYiuldMQCNBk9LiXK+ImYOvXPW7?=
 =?us-ascii?Q?C6u6FdIy3sG0QCVeMwHWBdhzVGnmtCs=3D?=
Content-ID: <9D70FE7315ACAF4C8E23465FF3457AFF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rO0xzE3YZ2cvBYrFlNadqJzHjyr/kwa8PN22l49n6H5Gfub9AQ0F8nPPU7uInLHsycrXlrAZxpSGAvluiL2p08efLLuQZZz7wWh/IPxbcANu7oN4eIMv2Z1vk10TTG1ke7UAv3GjenUsMD2a8CVGw7I2CuVM+JO6c/wb/3wwhOlqBInuieBZUXmBw13Fy0tT+2Zli7Zeofis4j1wWVnUTFbexoWge7qb3OQHMef+A+Gl2PjoIbvtkxo+LA+9kJqU+K5kfF+nHriRNauvXbM3qa5guQt2gHqTtlioYp3cKMeuM7vvkMS4X5b3XuOPHR01ZYYuJo4wGhwajkpINDe3Y2IT1k9yWUfNX3J902w3p18R9wcHrVeBTL7F3DJ0PBFYSIx0Fonk3w0hucJmNMATpTFYQwqLpF2A3h0oOh3XfgnfAXZfsnQJLDw/wWONf+xQu5yLXDpoA3cWlTjCsbMSXVjArmPvdyPBNhtUEiJPVykCX9S83dR4NYlxR8gg8mYq4CvOrX4aKVR1QoXyc+OhApK2L40sYJgoFBItFGnz1Tf0nKWTcsncIFWsIcgmdFeJ6QnVlXmqJYempcUL60cEQJIi9LuSQPbhItmxMhwIiswIwQ0N48RXkxZSnh8OVjt0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3200fa60-2dc7-46af-7894-08de79aa8374
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 04:57:19.0002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aSRgO8YjyUBzJN7XieLNNUzrIF2aIfSfS3GxEmOnit9I9iep0ZrYU2YYQRh2ALxGjBQL5Vq+stUksM1J3uF/PH4S1xYLy6MVkq38zFctC4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB6274
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Feb 27, 2026 / 20:32, Jaegeuk Kim wrote: > On 02/24,
 Shinichiro
 Kawasaki wrote: > > On Feb 24, 2026 / 03:26, Jaegeuk Kim wrote: > > > On
 02/18, Shin'ichiro Kawasaki wrote: > > > > From: Shin'ichiro [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
X-Headers-End: 1vxeIe-0001CL-8K
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 4E9651FACBF
X-Rspamd-Server: lfdr
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
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:dlemoal@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,wdc.com:s=dkim.wdc.com,sharedspace.onmicrosoft.com:s=selector2-sharedspace-onmicrosoft-com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,wdc.com:-,sharedspace.onmicrosoft.com:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[shinichiro.kawasaki@wdc.com]
X-Rspamd-Action: no action

On Feb 27, 2026 / 20:32, Jaegeuk Kim wrote:
> On 02/24, Shinichiro Kawasaki wrote:
> > On Feb 24, 2026 / 03:26, Jaegeuk Kim wrote:
> > > On 02/18, Shin'ichiro Kawasaki wrote:
> > > > From: Shin'ichiro Kawasaki via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> > > > 
> > > > A lockdep WARN is observed recently under the following steps:
> > > > 
> > > > 1) Create a zoned TCMU device
> > > > 2) Create a f2fs filesystem on the zoned TCMU device and mount it
> > > > 3) Fill the filesystem with files and trigger GC
> > > > 4) Unmout the filesystem
> > > > 5) Remove the zoned TCMU device
> > > > 
> > > > The lockdep WARN indicates that a circular lock depedency formed by four
> > > > contexts, as described below.
> > > > 
> > > > a) TCMU device removal context:
> > > >  - call del_gendisk() to get q->q_usage_counter
> > > >  - call start_flush_work() to get work_completion of wb->dwork
> > > > b) f2fs writeback context:
> > > >  - in wb_workfn(), which holds work_completion of wb->dwork
> > > >  - call f2fs_balance_fs() to get sbi->gc_lock
> > > > c) f2fs vfs_write context:
> > > >  - call f2fs_gc() to get sbi->gc_lock
> > > >  - call f2fs_write_checkpoint() to get sbi->cp_global_sem
> > > > d) f2fs mount context:
> > > >  - call recover_fsync_data() to get sbi->cp_global_sem
> > > >  - call f2fs_check_and_fix_write_pointer() to call blkdev_report_zones()
> > > >    that goes down to blk_mq_alloc_request and get q->q_usage_counter
> > > > 
> > > > To suppress the WARN, cut the dependency d) between sbi->cp_global_sem
> > > > and q->q_usage_counter. For that purpose, move the
> > > > f2fs_check_and_fix_write_pointer() call outside of the critical section
> > > > of sbi->cp_global_sem in f2fs_recovery_fsync_data(). This change is fine
> > > > because the write pointer fix operation only affects the main segments
> > > > and does not interact with the check point metadata. Furthermore,
> > > > conflicts between the write pointer fix operation and data/node flush
> > > > operations remain protected by SBI_POR_DOING.
> > > > 
> > > > Fixes: c426d99127b1 ("f2fs: Check write pointer consistency of open zones")
> > > > Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> > > > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > > > ---
> > > >  fs/f2fs/recovery.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > > > index a26071f2b0bc..87fd6cd436fe 100644
> > > > --- a/fs/f2fs/recovery.c
> > > > +++ b/fs/f2fs/recovery.c
> > > > @@ -922,6 +922,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
> > > >  		truncate_inode_pages_final(META_MAPPING(sbi));
> > > >  	}
> > > >  
> > > > +	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
> > > > +
> > > >  	/*
> > > >  	 * If fsync data succeeds or there is no fsync data to recover,
> > > >  	 * and the f2fs is not read only, check and fix zoned block devices'
> > > > @@ -933,8 +935,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
> > > >  	if (!err)
> > > >  		clear_sbi_flag(sbi, SBI_POR_DOING);
> > > >  
> > > > -	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
> > > > -
> > > 
> > > This was a guard to prevent checkpoint during f2fs_check_and_fix_write_pointer()
> > > where it changes the checkpoint as well?
> > 
> > I checked f2fs_check_and_fix_write_pointer() again, and it does not look
> > changing the checkpoint to me. FYI, here I show the rough function call chain
> > from f2fs_check_and_fix_write_pointer() as below. I guess this call chain does
> > not change the checkpoint, but if I misunderstand anything, please let me know.
> > 
> >  f2fs_check_and_fix_write_pointer()
> >   fix_curseg_write_pointer()
> >    do_fix_curseg_write_pointer()
> >     blkdev_report_zones()
> >      report_one_zone_cb()
> >     f2fs_allocate_new_section()
> >      __allocate_new_segment()
> >       new_curseg()
> 
> E.g., curseg.
> 

Thanks, I looked in do_checkpoint() in fs/f2fs/checkpoing.c, and found it refers
to cursegs. Then, this patch will allow recording the cursegs in parallel of
f2fs_check_and_fix_write_pointer(), and it will results in inconsistent curseg
values in checkpoints. Not good. Let me drop this patch.

I will seek out other ways to avoid the lockdep. I have no idea how to do that
at this moment, though.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
