Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPQjGsOPvGlU0gIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2026 01:07:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3FA2D4593
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2026 01:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVZ6+eSZgBjHJGNoyx2rtRq9M0ymGQKDrzn+yRIfmX8=; b=A5cfklshqMIM+vcHW65OOUvv/M
	nN+qg6FWflBHfbVOexUuFKcOANF93b3Su9fypPNLpmPB441qNU3mWPIwQAqgD9hISwQ3ZsQnz7/ye
	P2hSce7FIupkRSVQuVQOaVQyttMxodFhKMta2mlBczrcn+CowFZkL+mTIBC1KzmvU9TQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3NOa-0002cz-W4;
	Fri, 20 Mar 2026 00:07:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1w3NOZ-0002cs-IG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Mar 2026 00:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wlbb+gVuHfxx15SJW2cFuww0YJu5S806O8UngPbNb04=; b=YHt5o1HdNwn8QXjklbB97u7Gan
 FT8S3+6tATvNJSZ2+f3cGLPJ+prAIQljsN0d+LAs65sWFiVeK//hKH4ExXngu4KRyoCV5TxYwsadp
 TJIKqis6PFGHXvYx4Lrc5THiKx9Y0EpMVXFQjH0B0JGZ84QkZea1so7tsDBRpoxep7/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wlbb+gVuHfxx15SJW2cFuww0YJu5S806O8UngPbNb04=; b=adjhbA0uI6eBDNodNH/6oZbFUD
 8easLGgvZp+GeFBPkdkoRVwavKdvGFp/HuHRjeqfaMB457VateMu9VPfxRkZpMRhiz2bLPJ8yLjk9
 PRAbXc3KvjB1FPBEdBPfFHUD2F0FESY9f3kWQ/6GeOiO32++IJ2wpXUjO+r13+FQemmE=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3NOZ-0000nr-3I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Mar 2026 00:07:19 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62JGkffc1712055; Fri, 20 Mar 2026 00:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=wlbb+gVuHfxx15SJW2
 cFuww0YJu5S806O8UngPbNb04=; b=Qb7Ou8S2relpvyXpJ792TbPs/gTjdNysbb
 ZwVg95nRsDf9K2CsgHF9YnQWuch6lNCZb+rwGjxbsv7A1t8dI2KQ4EE5XoP5N1cd
 l3wjXP5MUYW7iblAPP3zovAiOnSM5Cd34urTJzjY7AuUuFyKa4zVBujM4i+oTfLS
 cTiqtycchdXk8lGlc97BogFja4TgIKEbsbG0NsDATaavnIXZw1ZbH7i4GfPAoVPV
 tLUQUhGRfPFuGk4+Nworpa7kbjaM83OcQf3KszK3LlyDTOW77E5r2/UiYm0Ndn7g
 nrBCuJtBeBeY0KYYF4i4VjzMEZ5Q4bFkgmJ9e/Pl0ptWZDefcKww==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvyj68tjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2026 00:06:48 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62JMENqa002815; Fri, 20 Mar 2026 00:06:47 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4cvx4quhsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2026 00:06:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyyCjRr5SrsNcFeFdG2igvYGoa7a5OOYSI+DQkz8LkCO7/LWzUILHuyOk0mDISY2XYkhiMHW0yxgGRupQOhaQ+6tVMCgrS2LlSR6EWiLNbvgv4kHxlBI9EAbkMtMIT0euZ4PTq1LrmoX16i5rAf1XIQTXLKqChtspQ37L/KGHlv88qlZU0r2zexnj2RnPJdkpj7Wa6yTgyXOgQU/LaBiX2HX6Fe6+OERCfKvTv43tyYjRpYCFgqmeFwhWD3pqyUSvTxTbUF3npMabyRvTZnvOWupcvFJ2Sxr8q6G1zHe5LstLavtcsFWQ7DLxVxaKs7S0Nbek62tzjJ5tx5eqRBAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlbb+gVuHfxx15SJW2cFuww0YJu5S806O8UngPbNb04=;
 b=XwDRbYMlw2CqxrxZlgpMtJkAy5bzbOqcCwWZhcduI394eyx/FP/iJGkqP9Q08qG9TnlJ0XTNngyXZPoOXLlJPgpQx5aO1N/EXOnp3Qtf6p2sEJIJPZF+lZnOpY04WrdX4C8HEL9nRqrVYBqCnx9VSAvdPGoleK6CgFgzBPfoKpR5MHObqsrvUH63zB1YDTnfxhvSFQf1/kpVEnZTX/6qB6CUHHSsee2bI95nq62ySIcqi4952RkVZzoGzBuCWny5zXwcJdIUmj9evY336WKBhVpQ3Ka4r8IwHH0XtLs7mRHMLL4vzEutXCx+9FO20d0Z7sD6abAs8zC04l1sjk+VnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlbb+gVuHfxx15SJW2cFuww0YJu5S806O8UngPbNb04=;
 b=GECi9BL2DOHDb0fZUagkvKbHE3PkYL4b8ZP/YKfl9iJL/0F8KZwUt92iLrOKG2Y5ysgyNDkHNI/7uO4gHdf0A0q68PL3Lu+4wvFWFWbyVvyYQmMhlJK/HaL+RdzlZsEsxiVPkHlygEhqj9e+a3t65ZT9v6pEzgWzpngcGISm0pw=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH0PR10MB5796.namprd10.prod.outlook.com (2603:10b6:510:da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Fri, 20 Mar
 2026 00:06:43 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 00:06:43 +0000
Date: Fri, 20 Mar 2026 09:06:32 +0900
To: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
Message-ID: <abyPiI_4bCRGQLBV@hyeyoo>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
Content-Disposition: inline
In-Reply-To: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
X-ClientProxiedBy: SEWP216CA0065.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::17) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH0PR10MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 4185f1b3-d54f-46da-71ab-08de86149114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: G3Izs7bF15nzQnvmBxUPW2iWS7ikRM0Y4c8pWpgxw1wwLBN058IbswDiXBMciajF8I2Vh6cMHO8xU6WIuGFG6kZPMsNGUyQe9+1XYDc59DWaJ8sIXBxQ+u7BMP3aavbrCyubrTNT3S8PybYFaACFxX1kmJLuhSVYn1jBmkw/M963m2S5/vqcH3/u97D9PJxHmAhcc3+fTurUP0J3tbzFKWPAVwT675c/nNVhDzvRj6uaDOZD0kaOcwB/N3gHd5jVVeJkQqcF88N/NqUjteNKwM3TtCiq1Y3qkmCcdk2nq4n9Tvh6D898MNEpETYTEvf1i/J50YPM4VNrRZKahw4OeklwPVF0Lscl7eQPrnSQigFd+JVDkzuSduzucTqeH0l7sw+JFVnkFeyJGpbY7/PAql55sLQ1j5E4G2JsjDpKeYFZ1hL6vMCaEWn9GAN6ftaNlwdt3W+7UXcmzj01oBXGFLbZZLeW0fQxVNGD3/cA0q6Rim6sFc1ru7yezSDllHPECzGOur6vtwB/RG15r9yFGIMcVZkdr9FHkyvB/jwFB3xA8c4cDr/CxYWw7xpjtdiyNKd/6+6F6qVzVZiuwh8EfqowUB09MGxnWgriZx0j7xlx0vZsOgrhgMuEFnzUdi392lT+ONDrF3pfJnHWOD0Nsswl00ph3r9vhpTCRAYidFlnEN++GmRreV/5eBeFgefelYM8FyUw0zkdeQtn7b+Sia9h3Xr08l1TLhyw3cJj9vI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W/e9MAMSPpT7zehfxCdnWBtz8Tvxd9rcL4CE/9wqgTnQcsPH5UgxJX2OuryU?=
 =?us-ascii?Q?ksS/xx5ge9TxJBbEscqTOnI68H2K0mB4Q5I+UzVrVWYYVELnrT9kHqPyZgKI?=
 =?us-ascii?Q?TnNfUddUKJD5I99rY1Uo3XdvXP3zqZKzz6zBduDfhRfPvk81pfBIMQXG7f45?=
 =?us-ascii?Q?HqxqJbjKkqPtPKB+CJynnhmEGQWG8V2ciMCR4Yb9L/FdsE4ZzFyjZ4JMRJ+g?=
 =?us-ascii?Q?sM79+bczDpLqKv1iz8hcdQitCv48Z0lGR570NfsfRjgPlpzd8ciDnemscqAf?=
 =?us-ascii?Q?QVIerSW5OQCtaYgTc8x8EvyX0aamVisn6gFooDSXRX08/U9oh7zyFwTFWeox?=
 =?us-ascii?Q?pn5CYKkzh/Sc4+JUj8Ayfz+3ia62AUqnP133ly823kvadvK81wke0KVZrr3U?=
 =?us-ascii?Q?+kQfAf9Byk8CoN489PekVJzOqncl+o5uIDFwXPncGExEDOPEJ+Ql0zqZlrS2?=
 =?us-ascii?Q?QKfOFFNXDAAfhV9RHkYz2q664C9Ytu/CjdsIuqEFFC2YnXi9kG27K7e0gHk0?=
 =?us-ascii?Q?vIg2g05ndQIrLNebh5RCtg3/q4o4pUgErbYhrxm/FefRYm5jHYMvsAEIBXyS?=
 =?us-ascii?Q?rvnGOoHBd5bJyRN7HX3dTobnss1CY5nvAB7oswzBXnx9XSERvYle0htVXdBU?=
 =?us-ascii?Q?y+BgFe3FOXAvw+5/IClzfX+u7DWeEi3+9Ln7kW+jEw5v1VEDPjx5DYl4e8sO?=
 =?us-ascii?Q?MSH4jjybLfDgF2lbXvwLgmvBtJsaZCkw9mNvMYZaCpS/lh4ZXu6R77/6HpvS?=
 =?us-ascii?Q?XHOKNDWigzLAJKYo/Zf53A+neR0ZaLcwvvmaNEkkAb9WBeIywSSKEzWD4Feu?=
 =?us-ascii?Q?q6rlIKV1/MJ1WCAx5JLjz3LapPfwKAWTfutAZr6+qhBu2DQBT8osJuG1bGKZ?=
 =?us-ascii?Q?DgzBjZQ/mJqkqeb0TZKygIc5GxY/1kKi1Y6wsc5YT0z0jxKg3v7GYkExM3ki?=
 =?us-ascii?Q?ZjORCAai+Au40K06qTBp6edPGY3dMFFodY5KenlW1Q8aC/tlLvqu2W8ApOvc?=
 =?us-ascii?Q?MP6IU9h01A3HEinNPb2PIjcrj2oMHpa8DCnC7v5eQA2vnFWZcbjyPWeiM6Vr?=
 =?us-ascii?Q?8d6XvgJ2AB6iIndVoxTy7iYiaayNkQpEPIPZS8IVGImfqvFLuYaRotkjsC3w?=
 =?us-ascii?Q?Z3GeUa+HRKZHalGPNTnBTZFBi1nEoUs3hLfaK2bLhJ0+M98hBdf36cv4aykw?=
 =?us-ascii?Q?m3JNElPPi6OzRoMPrPg+SlIhegG60PL5zoNA+woE/8ZJDm68FXHYxIoScedt?=
 =?us-ascii?Q?P00DDUIVQRtyEqXX1Vvlos0O0842rFjK9C41WxUYJUVheWCv0wgTyxzGmft2?=
 =?us-ascii?Q?GGwxr0XmJZNR1KOfjARuFjMCxBLnTSJdUJf1j51ui2KDr3tGXMf3nSMxYyxz?=
 =?us-ascii?Q?jdkKBBwQgNF17d07T/68q1AQSt2QXoDd0vDDypxZP78WHog2Ap7NJXn91iVc?=
 =?us-ascii?Q?qat6L0wBDivqS0+s2+5DnyJXwjBGSMG8NFBks/MZ4/O/n0x/KzuipKR/CBAC?=
 =?us-ascii?Q?tTtgOoG55EU+I8Ry2HRIommr34fkciSdl6ac2Iu1R3TAeuDW8E17O/vaLNeF?=
 =?us-ascii?Q?NYTdcEwIlK/Z5PhAkP0YwLER+GV2CU+aHez4a6ROZfbyV4ef9jmUZ77+F0OH?=
 =?us-ascii?Q?3CxYdIjus5IIQYRjWGYaUvB2gX2gw/9nuoeJj+2yLLV5gHo01kv2FjsFiWB2?=
 =?us-ascii?Q?9jT/vEcUZAdHPpnYt5blla7PW+AejHbSHEIPMiMaj8bk5wwizQsdLvG4jfUG?=
 =?us-ascii?Q?9y+vg1wtlg=3D=3D?=
X-Exchange-RoutingPolicyChecked: NWogYNiP+2tw5pn4fO2LGkHF3MHvorNy98Zo8lvSSUzlzxPSXr15yLp1kS2TfTIZ4Gf8gTv4KU0GPmxnViKNnM/MBtifbLS+vGwSU3SCIHzEacLbMrT3ZbBdsW9CxmMiX6dAkgoNtCjoVLCFgCITOJ2qXECniWSMe7zYYd8SgRUDCBZUitYE2u497DVPaKXjpGreogKN8v0QF8N/BncX3DiuII0lYVuOcU0UaEeyWgh6EjHn1yfdgmqQKMjTECjRZGRP49bMRfTlxYjbQ67zVghyelrFi+ysArYZzPIQn7pXzUEn75iDbQE84K0XCtqkzSmaQAc4iFwB2MyqqP/GNg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EhB+Fv4fw9OwgW/Tx3J2qnZuA3LCB/dyLtzHLZsk4SsTDT6/Hsn80yXegEd8v5stg4I3Xtzhs2Bt0J+Ye+BHALOHXlob1xzLpvIeO803lble8gQzkyPEQfLEx4V468DBJm6cNZ8Pz/+JwKObe2vhZoYx1lI4wuo36XUGtj2Oon4rZ450Qas5kysEV/FKbJfwS4tG/KRPNTggKylDxX9aIUlPGu+S4Ma34GsFKjdCGryTJioL6cePG1O5c7Hkd+a76ykSxfVVnqN++CefgMcsxFGnzbVZBeyliOwmaWoEiMjXpaMO+OOPNcmYpTV2QMihiy/N3FXzyMcB1P1lO0P/9X+/04FO4jDkB8lIAC1YGk5Ek8dZIdC0K5JqIe54E8JdgulWaDJVWW55mgXc/yKGG/fxsc3+/BJUxXgLcQ3eel13T+K70GNTfxdDlrChi0Z3SvTrsQYUnhLVJHJ/fanmdzXTc6nBeaFkkM08daRG8u8LuXo+Dn+4avAmYAAqc6OOHcWdd5PYjdmVbSN5avnMh+UbsWPI/wDOdGvac4xdvE8XXfO0WfISGNsfNm2JWsy+2QiGZIw5rc+UlNkP/1AfoXR3NS1TDHg4MHlyidjU7tM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4185f1b3-d54f-46da-71ab-08de86149114
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 00:06:43.0722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/eOiu/iBA7br2pu12B0YJNIE8eBf/s8aoZUuNQznm4bVnmmzo/iXFO0h5ifYxEb0bQxdDWXv+FcgHFUbypWSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5796
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=991 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603190194
X-Authority-Analysis: v=2.4 cv=LKFrgZW9 c=1 sm=1 tr=0 ts=69bc8f98 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=ZIbLfP8lhgRlLMFKtsMA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12272
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE5NCBTYWx0ZWRfX9EHjrK1Dr5AG
 nyt+8Hn9mmhVNNkDWqJ/Z4kVx43WOpPWPiDZjc4KkzYFT23PfylywhdLzhrUIs9+gVwzutpwoGL
 eQuE/YG0d4LCvdWIAtdxmJlgi7JQkR84L/GNKFUWk6nvvAzbkwY7wGd/4DFoTtIJyskR0s/nc0C
 OfFlRUI5v4STFLFxflJh71rOO0psYevMgr95Xp+R0HOCazK7B3XvRZtWH5mRnPJX5y2uqkc4jM2
 UONTYoV/SFgY9fJq5Pbqj5EePPQDpL5O1S7ERbmck7BgGHhV3SSXlx06BXrMyiSark6gq+eZ41x
 hM2qsWOTOOVjQmE1A+d2YtV+nz2oBZcCYpCduudpRAQHpP7ADWLtvrRzWSSWXlFobp+tcg8LBB7
 DaWmkWKBrbLWElhqmrHgD2CYuK2ReGV+F9Mk/abOqwZAPnMqMgmhlpGc8k87FuA69X/rhYQlcdg
 MOEGBmgxqjTG8eQf6xAq79apcywi4+u3xEhP0pGQ=
X-Proofpoint-GUID: mjN-1lYizngOezivitW0GKXXDpaE98IZ
X-Proofpoint-ORIG-GUID: mjN-1lYizngOezivitW0GKXXDpaE98IZ
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  #syz test diff --git a/mm/kmemleak.c b/mm/kmemleak.c index
 d79acf5c5100..b401954f72a4 100644 --- a/mm/kmemleak.c +++ b/mm/kmemleak.c
 @@ -107,7 +107,7 @@ * Kmemleak configuration and common defines. */ #define
 M [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w3NOZ-0000nr-3I
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
From: Harry Yoo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Harry Yoo <harry.yoo@oracle.com>
Cc: lorenzo.stoakes@oracle.com, jannh@google.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org, sj1557.seo@samsung.com,
 linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-5.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:sj1557.seo@samsung.com,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,oracle.com:replyto];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[harry.yoo@oracle.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7A3FA2D4593
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

#syz test

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index d79acf5c5100..b401954f72a4 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -107,7 +107,7 @@
  * Kmemleak configuration and common defines.
  */
 #define MAX_TRACE		16	/* stack trace length */
-#define MSECS_MIN_AGE		5000	/* minimum object age for reporting */
+#define MSECS_MIN_AGE		30000	/* minimum object age for reporting */
 #define SECS_FIRST_SCAN		60	/* delay before the first scan */
 #define SECS_SCAN_WAIT		600	/* subsequent auto scanning delay */
 #define MAX_SCAN_SIZE		4096	/* maximum size of a scanned block */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
