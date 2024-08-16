Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3D1954099
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2024 06:21:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seoT8-0005uT-Tc;
	Fri, 16 Aug 2024 04:21:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=9510baa95=shinichiro.kawasaki@wdc.com>)
 id 1seoT1-0005uH-9C for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 04:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9feCSE7ZlMqf0J0RXyHBpJ8rvpgh7au3lulD4ADZwY0=; b=MK9iDYaX9oexONVoc7kcLs94Fz
 IvtHZqNw+zU77be8b5qOV1azvAVLU/NyV4c8t3136htFftGXZHyKxnEbXwqT6bbc4blqiC9nIa4pu
 f5zzSjmehyoZM/ERR0Tlfd/4vOZnJ62w5pQQlDLOnGv1sIteP1czpx/33W9wfJ8U8+00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9feCSE7ZlMqf0J0RXyHBpJ8rvpgh7au3lulD4ADZwY0=; b=RLRyy2UnHAoEDm7SgFRE1J0zhY
 vNOolXZCD14Av4kvBR2EzbcwSfKOP5ZA50DkToG+LU94rafaycvLWgNONMtakjRd5H9ncnKEk1B88
 774b1gt44RBwQd2JQFry8xY9FbN4h33BirxtCeSRaxslVIrRZZNoB0It+2FJDHFLVN6E=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seoT1-0008SY-3z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 04:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1723782094; x=1755318094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9feCSE7ZlMqf0J0RXyHBpJ8rvpgh7au3lulD4ADZwY0=;
 b=IHQEFtGJ3vRk6Sqh8FKV08Q1apOeQhE8SuwQGIFGIgUKGclHorqDr0cf
 zggYJU+8ubxKC1XTJ8Q7bFNzB9MjCMWFdCTzNtFj4WVpQuTp79TgsED9g
 yYs8HaluFSzZVXDH5z4ZCDZBmfebPcp0kLpN1JMwNRX47oR4bKTDaqDA1
 2whZP+NjrjPLEv+ju452lXcTdth6aYsSFyGhIQpBp8qhlXj7P/WNeeWJ4
 TDKdavdpHbt+giMS77FO5xzav/7D8UdKXCGYkcwIFJ2k4dhudp+gOe9x6
 paIRrgLT8bAGyvAUMlyyLvjVGDyMBnIESR8m/tddsGTf+LLh7iIZ6wcaV Q==;
X-CSE-ConnectionGUID: a3jXHnNlTdqkNL04KmpIMw==
X-CSE-MsgGUID: hceCN4HDTgmF5PCjSnz7mg==
X-IronPort-AV: E=Sophos;i="6.10,150,1719849600"; d="scan'208";a="24426170"
Received: from mail-westcentralusazlp17010004.outbound.protection.outlook.com
 (HELO CY4PR05CU001.outbound.protection.outlook.com) ([40.93.6.4])
 by ob1.hgst.iphmx.com with ESMTP; 16 Aug 2024 12:05:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfwPrg8z0MRfpikiNapvTn06WXTDLWLWclQa1rZeV4IP8UI9l4Z9tQ8PuoLZdrjfZMEkf54rCVt65a5GK2bNHhv+dc8QoJeMSvRc6g+FMOetrwHPA4pvb55UXmx49FoaCUnNzhnubcYmtkztJq+eNuUEGvaaGi0u+1/QhQsPdCogvwFbbm2wio33yxxHOwae8XdRvxZiREl9enhL3UK/wY90AhIuxQuyZilAgfJIrjNCrWmVAO2UxtCIO+pBGxTSKIFxC6YJ+71F5o804TyifQ1gikyXchhkDP/PKnykb2kI22jcEE3TA+hlQqqJry7YQzAyuD2UaGLf02eHMyJNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9feCSE7ZlMqf0J0RXyHBpJ8rvpgh7au3lulD4ADZwY0=;
 b=fedincYWIHHr+ic4eLiDnh/V46cDkZ1qwTkw3yV6yh0YmQMJSK6rntK6zOFg0L+SbZ67KfThBy3OktFE1VwPHgBLEV9saK2gv2nvt4hdTSEfkRxLdLF8Z6XYXdtt/boHJPdnCS0p8ca4N3mZK+v4z8otVW9hUMHRqSDEKCCDHgwsX6Kw+xjHBRCGnqaLy3+m88OHKg5hoOH8lhmWAd2gp21/V6VXC6DN2ZluQzOO9ZfT4tjtUBAx4hXYyhRE75t9YKcaEA/tLUrSh8m4SZAT56KTWtgno57XYeWCgkugSEs9WL8mMpKu3i9/sqM/r6seEKDJ1BhXI6ap8Ll3xSUQDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9feCSE7ZlMqf0J0RXyHBpJ8rvpgh7au3lulD4ADZwY0=;
 b=K6bUeYkouG6mZGF1s9TQvqs8Nn7tS7R10gYBhuWTVRsiDA8gYtYEIe9XfFIt2G8r3bAb+nRDrv2LL1MzsTWW3/0xF3EN0l2fhYskJRlLREUE+Pnrpit1qGWDO8YTyLGVSv4rN+jSjFb3+NF51QugbLoV9qqSUXR+kUa5jbB6yqE=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 SA6PR04MB9172.namprd04.prod.outlook.com (2603:10b6:806:413::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.17; Fri, 16 Aug 2024 04:05:48 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a%4]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 04:05:47 +0000
To: Damien Le Moal <dlemoal@kernel.org>
Thread-Topic: [PATCH] f2fs: check discard support for conventional zones
Thread-Index: AQHa74Nc0p465GKDBU6xcKZBzJh+UrIpKW+AgAAar4A=
Date: Fri, 16 Aug 2024 04:05:47 +0000
Message-ID: <zjtwv4diihml7sv5qzb43b7sp6melskbujhhkasytavpy52rgn@m6yjozutuu3u>
References: <20240816022353.734136-1-shinichiro.kawasaki@wdc.com>
 <a4e822d5-9d3a-4d95-b568-8482385fa85c@kernel.org>
In-Reply-To: <a4e822d5-9d3a-4d95-b568-8482385fa85c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|SA6PR04MB9172:EE_
x-ms-office365-filtering-correlation-id: 01c8143b-d145-4fe3-3390-08dcbda8b584
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sgn+fGFZkQWmdSx6zDOh4c4LUX9PB36waDeH6h3ipGEbN52/TbozVPcqOG2L?=
 =?us-ascii?Q?yA5lvdabR60Sj8nmMkQW/Q9E6Unp7u8Fjh4NGMIUTzwAmiExYvi84R5o3kG9?=
 =?us-ascii?Q?zSp/UkOlFvXb5t+zcicuSPORB+I+IJWkCYWIg+kpoJJLqeTH/8cQNp5EoLib?=
 =?us-ascii?Q?+M0Dvo9KkInSkFfLaYGOpogolZlPfJl/LfOkbFeRvDRic4Anws8Ba+nWHR58?=
 =?us-ascii?Q?yLoqVDYADaR5YjHuMMGHiSs67SPmRiaazrt97InyZtEMcSU5KlnuV+UxQjGg?=
 =?us-ascii?Q?zvqTPF/sGWWMpmRhTeBb6GUVHDvAhReUFHO58lYB5Eind67if0jHJJFWV6Y+?=
 =?us-ascii?Q?FvYhEYUAumcYSfoFe8vhhK5L2F5IMix4TXOHfpuf1FqXuhtNSY5CjKGyly1s?=
 =?us-ascii?Q?gaGbr//8CKbFKcWHwjK8+8wA2szCpQLUW/nXvIdckzK0b/zE3L96BQHDmDCw?=
 =?us-ascii?Q?BFO16DBhWKbH6aFzFgSJ8apiKSBQTabwgHKExePrSBuy9knJbuvJofl7n/Ht?=
 =?us-ascii?Q?ubi08uMrhoqfy7za2BRnuz6zXK+uUdNKrbSzVasJkKPDWVIN8Qe6pKetFR1H?=
 =?us-ascii?Q?cT6Cokgzxt00bEaRvitdcE9jBYGGq2+dY8bsD+TBaZzstWzDeAFrEqBzxknd?=
 =?us-ascii?Q?XqwMz/iCTkYDTsijuAiH3xTJ/R3Y0YLaK4kLAJktpL91Bdcblxk/INXzOmj2?=
 =?us-ascii?Q?xnwhJO6FHEaZA8Z9H3cjHilDaWJupMgU1pX5kqj0wI2odvhgUE1KfgvLN8nr?=
 =?us-ascii?Q?K39ufz4/C0u15xLPE6fkKHjfjLf3d+9x+Pc5pbo6SygJN6mqYlXXXglJlVS6?=
 =?us-ascii?Q?AQC+vNkHztGU43EYn3nRT5t7l6dgWOm1VAz0rIiN3PE+80ieEh8rlmDtS8N6?=
 =?us-ascii?Q?tLBUAjtHbJtADszL1pnq/rVgLf+Pqp51gQQZptuz7s7onbCslrMcwHB6CEx9?=
 =?us-ascii?Q?au1fSsydceiRg7qAN7saKmCp/ws6NlDQd5N9/S/lnq1t8mdJS9F3MfmSWJri?=
 =?us-ascii?Q?vHyzFTg2BA/DPpgsQTbPndif/qyrt5m18GJCHmeM9JNiFlUk8lZTgdt5bh2K?=
 =?us-ascii?Q?6X/HL0TpNtkC/MNi//SplsDUMmYnn+EC5wwEuZhy8gRGZFVXDmg7Eb2QuJLQ?=
 =?us-ascii?Q?02kakzZCwxnl6U/ynzOXBhmYxl9KUWI1MgyxKql3Y9KDzRO//u0FhdKYAG0m?=
 =?us-ascii?Q?s/5PIh14tO6AjCEFrMqVkrZl3UCbHmoTZf7SEn+knTXiVC1bJzXbB5+oktka?=
 =?us-ascii?Q?y2LAZIyB55sYUMLhjBR/SE0qeVJLPsH58mc9PKmhf44Gsaojkp8CmvOS8DXA?=
 =?us-ascii?Q?1sXcAFA0SPz4v6Ij+Dq7fbfuXuB+hcTqvTTYZ8MnQl6v/nSYzbARe7WjuU1a?=
 =?us-ascii?Q?RBTv/UXHApwYjtxoQe3mBEjSI9VwjIsDym6PKzxJBqESxiQQcA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8037.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iJ8p7Wxg/TlzX0KOPYgH7EExQeV640BxYSD5PI7v5WTSSQjTyfEJKx3Om18E?=
 =?us-ascii?Q?6YybGJvmJgQDivYmynyHFpdMhU6qZ4FelxdssraFz1A4O+psdHiu8z6QnUl4?=
 =?us-ascii?Q?zZb6masnygouC0TOc5daz/s5C/6bou7GxpmswF4SLBPdWfjfhdqKhoLzXp4F?=
 =?us-ascii?Q?Ek/QeU23//iBuHV12jYgustKOmcpRQyh4HCaVXzwW3G7hq1V6wnF3Xt5Mb8+?=
 =?us-ascii?Q?xek4Sf8H3C3w1DwFGgXPGmxk/kpsdSt3M2WV4LSb/oyqU6ge7+LIsDWRwwjM?=
 =?us-ascii?Q?0lhPqVeiO7j+P6CX8KdMscBNkQXA3d87QfT9CuHLMJMAc69I8fSkAJBUQzcb?=
 =?us-ascii?Q?TTJneHpKzCLBrKCbf8ODL6W5v5/N+cFKOTwPVrLUTiZRApoYVC9GGXsE03lK?=
 =?us-ascii?Q?hbGyNkRvUdgPWNK+C/zaXv951lWexFOzTUXMxD0e22BKK3jITiKTGgn/Dkzs?=
 =?us-ascii?Q?hIeWF4k/8wFT5weCJ80ShwsDMDBNyhbUUAv6Vvn3oxaVzIsTNcvPVi9+QaEC?=
 =?us-ascii?Q?mh5r3WWeFJ7tExjjqlZqEj66+w/yOp81vxCleEE3FD8fMzUMNXUWn/2XCcUS?=
 =?us-ascii?Q?MGAVU9fExb0qTE8KB/ghvrlW8vtFIyBKPHWbCR4q+iwrihKKQH2y0L8ju5Ly?=
 =?us-ascii?Q?1BIEf1huEm3fvIBaC7UQnGHMKA6QSPQ9QIlxQTHBivs/FhPAAqzmoZD36M32?=
 =?us-ascii?Q?IFUTg1ggHdzpfg9961nUZrRGHjTfAXZHkzTnOtYIT+jpNDnsq+du8J+tJVvM?=
 =?us-ascii?Q?XbF5IYcDR/t20WuW8E7TQLGaalBDgFIakB+XLdniq28gw3gORNEra2321rpz?=
 =?us-ascii?Q?SnYgIVUzoUo744QH6vkyMqhcGMwijOeJiNWdv0PwRTLHurhj9OBsZN/WhlPJ?=
 =?us-ascii?Q?HdvZv0GMyFk80Oa9Ygq+LJNmjQ/Po2Dz9BoXWwVSoCbHO6riy0G3ABqs28he?=
 =?us-ascii?Q?u/kEpaMMxKBQdhQM5C7OuRMza2PE1noYL5mYPyy+aKL5BdET87iWCrnG3o19?=
 =?us-ascii?Q?s/xa7QLjMFv8CIViJnUMHm3WIF5QXxs9yNlC+nyw361Qllr/oWo3gBl5V6k5?=
 =?us-ascii?Q?d8YtHRUjku/FXxpRUje1+F917MmzONW2pmpz1Wk0qSMkygFRl1bXjVIm0L0I?=
 =?us-ascii?Q?2+B43dd2f77As75l+6jXjKuF1vE/Jqxg+DdM2kieLGA2sBoy2iqqDfvwJLXK?=
 =?us-ascii?Q?p6f/BFYPFz2FGx93aoq5G9NAFfUqEMOh/X9oP4voAWJqejhO3SOFjJLK0vtA?=
 =?us-ascii?Q?dj3ffYQ7czo0Q/qKS4AGDvCTgsw29uqtZLCOzMhAWIzCEKeUlePgICFUB2lx?=
 =?us-ascii?Q?y006DahzqzFwJErXA0f2zjugbUckoIDjwXsW5nZZVJG8Gx0fe2XjYMl1B0je?=
 =?us-ascii?Q?VT4s3cZk7RXHBV7cDNFZwoZyzxjtWhQn2SYv+4NuZCtzmPjvk1X4lMWDN+f5?=
 =?us-ascii?Q?hyDj3nBozRh/XAYI9ziP6ozT9XEnZ2iivBJwDYYh0xHj6MhJ5FDZEBJt5hsg?=
 =?us-ascii?Q?Cov1GMt20E9cZ2tTTQHQ00Tz/9PHyhmoAZZMCg4vci872HetbvElH2bT8qBi?=
 =?us-ascii?Q?QKgdUtwliUSoLzTKA2uyjcOoMg0xwicvgMLOcjaHGS9n+QpPhZh+cTykjCVN?=
 =?us-ascii?Q?+5Q3cYfv3DbJSIgu4qniUes=3D?=
Content-ID: <E5760376E382154F8867EB9B2A13323A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hG43MLwAP62KdJQD1N29IJlI+eMQdR56PV5yrgGaGTuIbFNYZSmU4CdnRISYuMqJfT6VtCSFJ5RiJeve3NS/04SeWvJCw7QOEvMvhfDo9RtO+zpR89o2GYXTGH7aCkac680p3HMwslPyfIN2SmX9uHMw9uZSIvb0O2MUIt9y5Hh9yndoqWwB7q65zREGsUDinHjVRjKHWSw/OPoNrEMN1VExhCxs3tgQDZs0oqk2L/PHY1ok7U+RIRm0SLeooH2iMdD5itLPwshUZe5Qf66piZcYvGxABBJEH24UV+h01Y1+cxAGiEQ/x7b4pcTqh1FDpekQJEh71EHZIggAPCGFKA/1ZYeYD2aA14wdsC65lIIPdTlOMIvJiI2Xl7ZzJS2GiW9sZ574QzcUy34imCGICXHUm1Iy5U+QlYUNhnvxH/3raKNsozyYgw5W3ucdPVcO8GGZ/EET6uYVsrVqTWXvERrOcgzHPVLoxnQMSBVAJq6xHx7lXta0hc57jiXDy9lDKZg8vvR23jNmPLze1NeyW08P64XVcU5bz7RJhFbMGu7tqC+JVBKoiBEGayAlbwLiNotrA6hsLdghgzyA4Ul+CADsoRwCy8bwGGvr0wpbyfiqvA0KMmqvV97L0cmrW17Y
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c8143b-d145-4fe3-3390-08dcbda8b584
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 04:05:47.7065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eT8xyOiU0ccycx54gPK4+ZrniN4FZw5eYB+/A4PCfY6ugrQGYp4D5fKG9kzHlp/tYkClDaC8azsUCPgwn0lz4d/HkEWfgaf7kOzC08ScHoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9172
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thank you for the comments. Will reflect them and post v2.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [216.71.154.45 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [216.71.154.45 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1seoT1-0008SY-3z
Subject: Re: [f2fs-dev] [PATCH] f2fs: check discard support for conventional
 zones
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
Cc: "hch@infradead.org" <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thank you for the comments. Will reflect them and post v2.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
