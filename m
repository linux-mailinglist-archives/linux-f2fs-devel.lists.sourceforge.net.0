Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 502639006EB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:41:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFamB-0003Nd-PE;
	Fri, 07 Jun 2024 14:41:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFam9-0003NG-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d5I8ocHWHz6H2pM2fMYDqS7WJ4JA1u36cowT/km52RE=; b=LY3f/4c+nVWjaAq1YjOTe+D0D7
 EtnPG8yZDwR5URaVr/ZJTPH7RAKUw21FKB5+W8OZna7iBt7gzR3zUeQM6GwCtG+6O9MWPDGDiVCZc
 0BuN0m27x0PbJ0wiNBfUBNQ11oDJHs+vQTxQjR4WWTxf2Hfu1zHwPAAFCYa0HC0+41AY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d5I8ocHWHz6H2pM2fMYDqS7WJ4JA1u36cowT/km52RE=; b=D6PgoP7usvAQ9umJImeADTH29w
 V5hUY/6qolEr2rz5nnqtNeieu1pS7rB24gw1xAZFroIAfk/LbS7p9iQsFR14msGkL/t/ZbtyvVnQU
 48YDgtfjPNAkZPtE//RR505rkp1W5z4hAUFaBEb4vcQP5ris7fTQyvi3iMm0JNTU4QSo=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFamA-00031k-5J for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:41:06 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457CuVOR025434; Fri, 7 Jun 2024 14:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=d5I8ocHWHz6H2pM2fMYDqS7WJ4JA1u36cowT/km52RE=;
 b=Tad6qOG18iHahTkTLRvUu2tsuPEx9Rvr4zFIzRUikirR6KwX/QePQBkrhBtVo2WOlWEN
 E718rGLu4HHDr5WtRA2Eoxei05ZLotQyFvCepbXtd7B8oZSLfPxAAHfPmegDPbwbPnc3
 AUZi33d0d4SetsyG7BoP55D11IiP8P6tQXWria7OqK5Zpq42yZq9DjqylQBt+1gnNhZD
 z6riyDllJ45yEMd1tJ4xCLrN3LPA0mhqOnQmhdpyShwKHAP9u4Jz0zow31XgbdHmu1dF
 sdOiiNL3fLrc2KU4A0GNm4ndtdJaXL3qQP8GqT95N2JF2nmJJo5Gm6ZXX3AyvoElRjX9 Lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ykrtb13em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:45 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457Eawf9020559; Fri, 7 Jun 2024 14:40:43 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrj6ns9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bc2ptWWO8g4mXb4GpXBxAT2t8LqUWGcWWD0E2uKSqJH/mcmWei9uEX/7aK+naIUzeZept1ngkJeTHc3b9car86YkZ6qNt6ZzBMdyHiEMLKTsP+FZbQ17ZTLGZGgox/kzf9TkjSF0zSEBrki654azE2Db7gwKK7rC4Zv+BujEops1VI+yqsFWNeJ+fQ9L9kZB5wr4OuLNTlvCXaXmHWJlFVPW+5GZHSk+QhfJqg+V6xqjarDHfSzozFUWMw3kl1WHtjGLf+vdXHb74iWvh7gBUKVT3jeEYqjx0zUhjt/MhClBgMgPugbW8Ll0D5HVZlFIaweNTVdTIp37WDNPldUD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5I8ocHWHz6H2pM2fMYDqS7WJ4JA1u36cowT/km52RE=;
 b=SZwdaaMNtxDxcCrONMar1WQpb9Tst3w3YjdytknTeLUQDCY8ImUmD36JBlqiWbiF2sautgD+ag+fDP9/UqrrhWjfy7iu7byBamx2Xnj9IBkiR+6E2Z+dVhDbG8JvTqCqqjwTHS+ZLHXKqscgaJ7v73ndIMrZ7WJr00DgWhsu6s+kAeYRq/0KhH+AW49IWLqzPSPlWBnt1qTflQgPeD0/7GSc2DXIqE/VIWq7Q3PX5rEGKUsdDgv7SQJGMa7UHbRdPU85SaPCffZ4UuBFyiCQELb2OVZttTcD9+8CRVVTYxCJwo8KQiSGqgjqDIDtW4cYlpB+spNbZEbphqP1MXapfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5I8ocHWHz6H2pM2fMYDqS7WJ4JA1u36cowT/km52RE=;
 b=uZYHTFHULT42pNw6iT1B2OTFnbZFHZsvq+ooCOBRzPnto+JJatGUX2OuVrMu40ZnughXez/o2iL8T6vM3OEcMWB/bBBfo6xCas9ipWKDJOM7M0Q0Ev6su0zKbbdcwCqeq1Te+HBi4+PHdhLlRQ0Sd4/CReB0c7koDtNPmUBJ2H8=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM6PR10MB4170.namprd10.prod.outlook.com (2603:10b6:5:213::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 14:40:41 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:41 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:39:14 +0000
Message-Id: <20240607143919.2622319-18-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: LO2P265CA0291.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::15) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM6PR10MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe44122-8cc7-46cd-5c5c-08dc86ffce23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j7rlOokkzhl4soLiyzDvBU3XRCfzDPHpzmfqAuAuyrIP3m/IQ4aACn4+V6uR?=
 =?us-ascii?Q?hH7yfitN+9nFf+8CGHazc8/C03a/dzLPEMdaieHYnE3XXRILwfGnFPZ3AmED?=
 =?us-ascii?Q?QR3whux2mYwFY91flQgPI7LXI3TwQrWLB+6WIbAdesbKIDnFo5HvrOjChlml?=
 =?us-ascii?Q?qPgzpV1ePOumDEkZsV5/18WcG54l1osISzxIAZf3DsJtGT0dbnJ+EGMLhcmN?=
 =?us-ascii?Q?HP9nZXBxb4FniNgW8IqzNPx1KO80uX9uPLLP66f7nInZ3JeG1HS5OgRAAEEi?=
 =?us-ascii?Q?bWgOtbrhJ2KcD/wfX1mT71Uobc5jbqoHC2ofaJz6wXdz70W/pNHxKaheQZjE?=
 =?us-ascii?Q?lK8TdWp/++TKtW+3dzdxLOoGOqqqrhUHQ91bbYm0XEc47bDtb8++lwwgg3HF?=
 =?us-ascii?Q?0mEj/WfdP4cmjy7ZQzf+B0dbBHrwJgDkZvxXfQ/y8bvSHevZGamZX8NiwMkp?=
 =?us-ascii?Q?SqTL65zDCwVzKdrw8HHgMb2/tJQx1GAFXN5zrjvcSrRIUoiqdTcuWyj8cpIt?=
 =?us-ascii?Q?t+qatoEAXkzS2+pdrDxSWJE/HIVdxCpct+0Sdy8T4FN1IydSYapsN3/5o16P?=
 =?us-ascii?Q?mAzkCIpnVurBZMDTp2BZz7TQ+yhlti0VOaRr2X/nVYri+/7vCTCZxE0o90A/?=
 =?us-ascii?Q?YCAm8vi9SSi+G1AQ1xScHjZyzYTBcVoOUcKvJHsYHK3nnR0wo8uLWp6hkax+?=
 =?us-ascii?Q?B2V3PugJlnzJJ6FqMTidtaxsHmd2GP0dbe/3RNgARChNNEW7z50CP5Yck+WF?=
 =?us-ascii?Q?svBMl2Lk7xR5tH036Pr7miKHI1MA5dPfLL7Eg2Hyb25YzzoH/7wIyUYII+ab?=
 =?us-ascii?Q?9FDH8+/Qne4xG5HAH9ZEH77+BwzrGK9C4CrBcQ3w6uvLoj3wf1iVnknia0pn?=
 =?us-ascii?Q?0m8pUXG6ObB4C0yozIW8HTb95a5D+C/zsWBEFdsUzao/TDDR3jfIbJbi4TS/?=
 =?us-ascii?Q?wp0gXaiqne9LYEPnAjYTtW7Et8rC7Ap7mWvOOJwVhAzpvqrGUST/mwkMB+GL?=
 =?us-ascii?Q?0gj0VU17MCN6L7nMUXH/8fVT8xkQF501ng3ly7cq4AuT+G3f35PI0lUI841/?=
 =?us-ascii?Q?QJQo0Vklj3tcL9OHZ0BZNtnqGAC+yOSqQSpilqwH9DkKwo41QTLfg4x2u+Qg?=
 =?us-ascii?Q?zg7yy8RF77A8blWIB+qx6h1N7BpvG+j8p7ySFXvzC/og1Oc+bJjK5p4/aWDC?=
 =?us-ascii?Q?vfiGnNZZSBs6SZBz2fdLd+fdJVuRafMGxLoAMtFWmfk+Ub1X2ygTjwG7PLMd?=
 =?us-ascii?Q?9mj2MbHho6MdCkd9y3fUcET6xJHuobz/8H1RSQJQwuFIf9wgL2haRMjZ5bG/?=
 =?us-ascii?Q?T5JJ84EZeIQlggPFWhESNd+0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9TKOAdyuLYCiwaP3c8+skhQB1NB3wgsGFBu21m2TWsAWpo5Q9N3hVxm/GioE?=
 =?us-ascii?Q?okqziw/2Ri1cBJfCeaiCQoM5ROdlW244jpITNHmrsu4jGNqFaE08X1AeGYRY?=
 =?us-ascii?Q?0B0NOZ69h/2BZG1nObsHYA0w+xcjZt76NXm603yBiSbmorNflDr4dx4k+weC?=
 =?us-ascii?Q?am4U/nGJlcnodzWxAHQ3l2A4fFQ0J/5yYHbepdsw7aKIY9muEZgwPjcE+epD?=
 =?us-ascii?Q?UF8MlvDt1xUI2qJuP9jlYb3Cz3dGccUc5Czr2eYjRfYABbuzAngZ3Fb5L+9M?=
 =?us-ascii?Q?sfMkw2CrQ8SxHPPksHYtkhdrIY0Vh/mH9QbW7o3l5BuN8/WTjCsqYIfcDKGC?=
 =?us-ascii?Q?wArUfALgE77wIFAV5O0aP5mjAyB1GkNOEouwBs5RcQyEoN+J4X4AiecIvlcE?=
 =?us-ascii?Q?eLV++6g9QL8CKDo1Z7pRq8T6WW4AO+toYohvZv63Ns7iWG+ln2YOca3Bmk12?=
 =?us-ascii?Q?iXQUp3f6XmTsCifX/ZoZX0jhbtNza7zq+ElPbKw2xX/Aq3+Dh3CAMXd+5ETT?=
 =?us-ascii?Q?H4Ga/a+IPQ80pcxnfOH6zmlQXlkn27kvFUSNod6gAY+ATG6p2Yz8pawdV+4n?=
 =?us-ascii?Q?hc0ScOxF9F6KcjM8EaXbctgtDAMEqVX9CZ5LQBvhn3ZTmKfPAinS51iuIAU7?=
 =?us-ascii?Q?MT3tTEjoRPRJlC1gYe7wkYoANBGwA/LxDReWErFk18NzkjSHzq8s/cvkVJCu?=
 =?us-ascii?Q?kLC/Vsgx/DWlkUC+eBXgGaESo4XLGmHxZJwmNg6hKPKZHmBJrPLgBboeaYVx?=
 =?us-ascii?Q?Kw/0DvSKMz4uoiLHXBhmUgLnRQCItxiJUkcXET5XYpZG5HRhrzYKEM9qOnSK?=
 =?us-ascii?Q?jlLC5ZZtG2ZIxR4p1x2kR5uGd2B5ea/ysL+Kf7zTATxThPRQc5TZlPkrb5P1?=
 =?us-ascii?Q?MNPaw5vGVSKhg4+06yySx4M58EaKMY+VZw/bvXnt9w9UkV7Y/Fh9xHuXvt53?=
 =?us-ascii?Q?4/c+6RybH93dnRyIOyN4TOBdcHolTAwgwQNzvndSfd/meAv06PWRhN1A7NRJ?=
 =?us-ascii?Q?bf8uhx98OvBs/mxLzGTeHSG4t/G/xgQFuUSu0VsLuN3BYVG3edpifs2Kv22S?=
 =?us-ascii?Q?W7qvMlIxf6hf+Z0ond/3DfbCIODJ0ObRcrJRt48takV8c8KcP9DN+iTWzx3e?=
 =?us-ascii?Q?syAuElpkLHlAfaK2hbHy6a6MedB6lKSNuS9npHrfz8BYGS7GzBUhC+rmpnWT?=
 =?us-ascii?Q?B0U6VD9bxXc4RlXNkc1JD4CAMqsLisDdLm/m9fmrnICFAI8c8SqGcHpOO5Pd?=
 =?us-ascii?Q?qgPcOF4n4nJZLnDNkwp+pRLltS3efGK3SyvDV6yezcjWBRnus1vVkTO3YByq?=
 =?us-ascii?Q?0SB2uOCjrKO1pKSTe/Vcgb7A0NxwZaHwRiYuPKokWreI9gVBfgl8/k/rPsBF?=
 =?us-ascii?Q?k+vapX94V12L5eEpKqCAxBSADoVWKAgMJQMqzgxp9j9NjOKafw4LFDoPbqzo?=
 =?us-ascii?Q?G0ctYpud7x9E72lSp4QRLOAUu5pbePtGnCaNkvcAEMjSOiigX69yLJvkUJgY?=
 =?us-ascii?Q?knquAdvMDAhm9N3AHvdFeFvRSeNc7w0aAxljGK3vJelEkOWj1xFt3w171Shv?=
 =?us-ascii?Q?PqnUYxiYvbi5MIETf3sO3SIk/WYZ6OWbR/IzfwhuUAWBslrmzvPeDctgMRek?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CRfmhKW2qwyyD+o0mxpcWn7hlxhQbYiIB/XFWy2yONHDg776fk5e/Y3i0ttVdI8/dGmcpICjXPjnfiKzuvXNiqRVNb08dNdxO+HfuR42+Z8kv2A1ZX4sF01A5kur/OLdO7g2nER9T3W9muU77k0UcLKNMxED11GlphtUDyVkV/rE93ofMr3ZbKogfAS23lB3lJzaEi4uyICJvmMkmJ9o9bJytUAQ43cx8rc4g6Og3CTNfPl+z1egWbrWtw3IHb4dUa7osXxtOkFZyYoG4N1WOTvniCpr+dCtIf7zoZ6HJ01BkUqlFe5vV3qhFactoG4FVMUJ/mpz9Cb2tJEuCVxqT4RQ2cnG9jKHkAgnmCbbfKar/jSMzfB0boKOJiG1Yt24Jq811Tt0q+OAX3u5jFQMhio4oxuSm/Mj1Vb5eRPOmyiCRqHiZ5WcOpp45H5L28Kh71mSS4yAt7VbrR4qh6dWW499Ue9OIh9fH//Bjq8W5T7r1+xb3Okm06KHmBP5b9++3Td1lzj0H1ycHY7K4CxqG5EgpYjOA0tbIVncrOWptGUk3cXiSoPIl9qkTECDCHpokq321VgYpHDiKQOOAP1xHtTTy479HDiRwTZ8TCOgZbk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe44122-8cc7-46cd-5c5c-08dc86ffce23
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:41.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ig+Pg7+BUoySDdFWUGMvXEg7Qw+RDyjxw1Cn2C2o06JKKeAA+gAT+bbfzpmUaef0gb20omi5S5xcDiFo1yueLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-ORIG-GUID: DYO7F7787pyYfkv1cNvtdrzENZy8WEId
X-Proofpoint-GUID: DYO7F7787pyYfkv1cNvtdrzENZy8WEId
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a flag indicating that a regular file is enabled for
 atomic
 writes. This is a file attribute that mirrors an ondisk inode flag. Actual
 support for untorn file writes (for now) depends on both the iflag and the
 underlying storage devices, which we can only really check [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFamA-00031k-5J
Subject: [f2fs-dev] [PATCH v4 17/22] fs: Add FS_XFLAG_ATOMICWRITES flag
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
From: John Garry via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Garry <john.g.garry@oracle.com>
Cc: gfs2@lists.linux.dev, catherine.hoang@oracle.com, agruenba@redhat.com,
 martin.petersen@oracle.com, ritesh.list@gmail.com, miklos@szeredi.hu,
 John Garry <john.g.garry@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 mcgrof@kernel.org, mikulas@artax.karlin.mff.cuni.cz,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a flag indicating that a regular file is enabled for atomic writes.

This is a file attribute that mirrors an ondisk inode flag.  Actual support
for untorn file writes (for now) depends on both the iflag and the
underlying storage devices, which we can only really check at statx and
pwritev2() time.  This is the same story as FS_XFLAG_DAX, which signals to
the fs that we should try to enable the fsdax IO path on the file (instead
of the regular page cache), but applications have to query STAT_ATTR_DAX
to find out if they really got that IO path.

Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 include/uapi/linux/fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 6a6bcb53594a..0eae5383a0b4 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -160,6 +160,7 @@ struct fsxattr {
 #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
 /* data extent mappings for regular files must be aligned to extent size hint */
 #define FS_XFLAG_FORCEALIGN	0x00020000
+#define FS_XFLAG_ATOMICWRITES	0x00040000	/* atomic writes enabled */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
