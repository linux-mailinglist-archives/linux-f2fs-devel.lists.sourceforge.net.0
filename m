Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788AADCE07
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 15:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jm+uQ0C0+NUmUzEWjBlNA74pxVAMplqSnuBMbpUgy1A=; b=jVsnjnjVe/5QFp5Hm0FihXc6cZ
	UW7gepWWWXdR72X1ru2uVQaa4J22Vn8aTD88ae25SdHkiRmyKt8ItYZlXmy6Il2+/IZk/L8YVtMY8
	hoQ77LGMdVRxWt2/P6gmX0FaWi0lVG10hHAHOYv+KGJYBstgnvd19x6Kljf+5rAelKmE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRWfw-00040D-HC;
	Tue, 17 Jun 2025 13:48:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRWft-0003yp-8E;
 Tue, 17 Jun 2025 13:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kFDBLgmviF03k4EAGDeEWTa82BAKv5Wv8eqmL5b5KQE=; b=Swyp6Y+hsVM53s1xm3ptamJSIi
 wletpGBXIEzhIZcBfjqxeP4IpHA3zazbjfmuZgKqgO2QM2D2p4RRrAFa8fqAWz3lgkVNuQ8871Uzj
 Dyjh1JDR7t1+W6lzvWaRyPFz3NdXoMap6XovCLucHRV8zClNo5F+TPKyec8cjZZKR0VA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kFDBLgmviF03k4EAGDeEWTa82BAKv5Wv8eqmL5b5KQE=; b=dsyAH0Yang9Sir250vaz5g20I/
 c18OkKfV16sA/vGGszk+fXBfev9Ki5LgW8cCEc4S5H4a/MnToj8EAXc16kZbxzVDAMt0WBG7tpbND
 g2UkTH/f3c+d29P1YwQpQqckSHDoEdTaApqiPNhQrpFP1QH//zl7fsXCTzXGsROGySXk=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRWfs-0000BU-MC; Tue, 17 Jun 2025 13:48:29 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tYIP026713;
 Tue, 17 Jun 2025 13:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=kFDBLgmviF03k4EAGD
 eEWTa82BAKv5Wv8eqmL5b5KQE=; b=Ao8CHT1WSzNpw+sC1tpleYQ8KbuZ/URTmX
 MHCA1oeiD+zmwaT/MjyyXAOjQ2W51pFpci99potCcwEp7Zv5H7gUdWqAhw6aPl5C
 8tcXENpJ4Jv9J75ZQa75Mvm2Mji5pHWIe6AUBp86L/Jb9HaDFmdim5OLMg9AqAEu
 XydZTVfGsfkx2MiMarSJafb4YLNH7ayS9eqh5M8V9UBNMXNp5V5PJ5ziRaWF5Qge
 oS7tq39vWB1AedKcqhloPMr68qa0tu6ZS68TQJ2jxVoOwtG2/b4a5uGHNxBUXknE
 QKdPAWFOiDzXWC/CsLpHFT/Xsp6gADleAv6Twz9aUJ1SZgP+8+Rw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914en9n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jun 2025 13:46:55 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55HD9c5I025973; Tue, 17 Jun 2025 13:46:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yhfh0ht-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jun 2025 13:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1iYW18VM9RtMgYuw+KjcSUL7oaoFzdb7XTxILLYI14x+Pc+sZ3ebaoS4WJ5gEmbKIohqxGSegBcls+JF9EDJLPDC9G6FLtvBRC+jLeIKstdq6GA6k4qAaT2YDZcp7kB/50k4XBnnct3INqLVWMW53CS5z3qFBzcpWdQWfCWTXFxIr/KUu+QA91j/fmxAf5kv/UmX2/19YXeQ+rRFnyUnS08Iu2PJG5imEF9pvlh7nzdtIrPEZzRdTZ0SgUK1gQCYdKngbkttlwCdpY3KCzudLsmEv5BjKZIH4LaApowdDLvD+6qn4OiOVkVLHWhFYRVihaFVF6EP8pS+VIuz/bxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFDBLgmviF03k4EAGDeEWTa82BAKv5Wv8eqmL5b5KQE=;
 b=c2okbzpmgRpsL8MloNwnoO2I0e9gVzkA48+KeHvd8iJV8r7xoOtuyzzdstWJ5m6xbYbKZZlm9CIEDPIqkI74Ye6m+K1NxY/TqrM940crP4OnQGIhOVoRMh7qdZWXIRtrRPDiRzz26v83QNdqe5GVmvFYFa8WkF7DwJ6C3wGe2+RfXhrAE84fMJVzowSR+bSnQh9BDBdQuGlvwbc6EsH78/R5IvYYiDoMfKlB12oJYq5ZszUhRrYbqmNiXfaTkbsbbm81/hYUc/dhJKNnu6I5DMpMMWr4tklxMzZyz5vYh5DeE3uMOcoqcicF8TUT/zp2BREmKLSTnxQNzwtgdHm9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFDBLgmviF03k4EAGDeEWTa82BAKv5Wv8eqmL5b5KQE=;
 b=G8tmWYJaSvLtJRQ22lknqb5+ycBkTumRSi2egVJVy3moFJ0qv4zZ9LacL6TuL44UU6YNteWp/pmmNwL9KD+eMWFZO0mHZWgCEkGIBwKZnMfHVmzz/Ndfh67smqUo8LAncMdGteKqFbyie+RIr4nKG8sVqLZfN3v5k02Eyl28Mhg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB6125.namprd10.prod.outlook.com (2603:10b6:8:c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 13:46:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 13:46:48 +0000
Date: Tue, 17 Jun 2025 14:46:46 +0100
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <45c1da59-357d-4084-b4e6-98285f88f99d@lucifer.local>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <20250616204149.GK1880847@ZenIV>
 <92cd3a83e5c244a3e4a5afd5af61cfb3f8962338.camel@kernel.org>
Content-Disposition: inline
In-Reply-To: <92cd3a83e5c244a3e4a5afd5af61cfb3f8962338.camel@kernel.org>
X-ClientProxiedBy: LO4P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ca3715-97b0-4d5c-f2a4-08ddada56840
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x5GC80u0pByI8wnXI52yeQTMz7Suqn5Ijd7ghoOAKX/LojPUrLni7jAv0dp5?=
 =?us-ascii?Q?KDfbf88mcc9exzPHFJgiAXKZTmcPCGYUXuQXYAdilbKfJofuKbWQ0Kk3a09u?=
 =?us-ascii?Q?uRoviPMUTBFz9NITuDQhWXmFwl7dx22L/I80cTlvKpR10BSVNmM/c2/LDSi2?=
 =?us-ascii?Q?Fn+oFPPWk8pQXWaE0nTHE1fEFVTv7CQV0pvvHvy3EJUepWhiZZK6WIlzWGH7?=
 =?us-ascii?Q?xMjgM2DBqpxUKBhF5hnRaV7/RWD/cZBHHA7kqYVw6bIPg2n1iNVvHNKzULFa?=
 =?us-ascii?Q?XV2VtSJSQ+clsV6iKCCA31SY1+2KFCCRNp1OEDF/VnjqSemOZhMJfChlHgIa?=
 =?us-ascii?Q?AsxKRTEV9Jz2r5tuSU+d5J74vwfYMtP9bi6dx+kCCep2bQ/ngLP1TPp9oYDN?=
 =?us-ascii?Q?XRtmIOsnu5T2gkUKe/HOwTQ3XVa6SB159nzFCrrfY/r9JoMOH8JTsP1i57M3?=
 =?us-ascii?Q?pL5hSCFgpe3i1iOfGbCpGu5WsiAoVZeIt0A8RLhysY4cDpDCVKZ0XF8r4NRf?=
 =?us-ascii?Q?ApI2fGI4cosuQ7dFs2IVOfZgKk500WpCumrdCpSecGuiSD+7pu7pJUTUlmZ9?=
 =?us-ascii?Q?pSK+OlpmjAEEQZXWRCZOV18Q6hNHDc/tMglPaqJCh3gJy09oPCdHr6RwUOTp?=
 =?us-ascii?Q?eH7AB44EOfP4kLn9fUbqmXjj3Xd+Jg2c46pRTmLKrvwRxWr4uwxLZuUGYG5S?=
 =?us-ascii?Q?PnDlnnTmBCti6Fmn/5qMc99H7Ka4vDoIQvtZr0pRImYqCS14RpQH3VybNPdf?=
 =?us-ascii?Q?Y5pAMNn54IDYqepFLj2/F1/I/+DgFqaSUWiqxBegMgDbO6yVcQRxvVD3+iQS?=
 =?us-ascii?Q?uj/Z+j+4UdAM1Zpl9QTST4gac8IIkkGOV0t4jfiYVz/uXzoMC5igZhttXc4I?=
 =?us-ascii?Q?ceL0Z8ANXDuEJ4FijgS5dv/0HkaO2QK48C4aP0cQjLvsLVe5NTKmf/4TFcFP?=
 =?us-ascii?Q?698zKWR1FQonYcZqHdH9V9PIePOQDu158OgA/2GnnpvsdtRrG6L/2iGY8r4A?=
 =?us-ascii?Q?VkLYZVsZg6cWd48ECmCkPxnJXCaJvb2UOa/MVgyzDBFp9s5tpIVXQlshPZ+q?=
 =?us-ascii?Q?1evYBWQi35fzUb9wAsznjrXyKj5Vs1nlPCAT3WUJaqT2bb+/EeL+HIf6sXID?=
 =?us-ascii?Q?SQmsQsIWzHV0XpcSzX6gDYBVvXiZKg7rq982PvrmsORXt1GV0vG4HSQU5Aj6?=
 =?us-ascii?Q?0WVk8ze/ZmtJ6fQj1w0NS0nZCFTSneHCxChDVtgFX4MPED81GglQ9m+mK+qi?=
 =?us-ascii?Q?DZdoWL05EHuEOoQeSTfg5PH+x8g8yK3grxBkgX72KEtxty6CeeoUN4vPiKqf?=
 =?us-ascii?Q?TrrsfWLwRU6Zo333dBnUWuETrweTCxvLLAyN4YJjxR9kAayGrqszcYr3rGV4?=
 =?us-ascii?Q?wuhnr2uJZJBoom+/Iaa1nnHQu7oSH1ZFwo1Zp5MbRXPj5zBHljJN8xE71+sH?=
 =?us-ascii?Q?HipJMQ8MObI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tChXKkvgbqB4KqhkZs9XL1A0X+3B6d7YIjMUayfzCYd2mhMeauUgrK8rWl6T?=
 =?us-ascii?Q?KNCAQVQIzsZipEK3dgiTkuZ8yzjhfAMYSftGR4wrJ6IXyCXhvhLklJrnbfB8?=
 =?us-ascii?Q?BcWLca1rEX9uao7V5L1sfm0U9E0bXgBoMTwUUNTmyOkruns3zCcpQeEi/Zw9?=
 =?us-ascii?Q?xFJjAOcqXA9tIhL2ZZVZ1i/ulDu1AURXzVMG7uSJcGnc4wKQbixvQgsegMmM?=
 =?us-ascii?Q?3ih85lHiMwTEJbUaHCrlqQMsruN4Gt12kMwSJLks0G/Unetz3GMVRscG22au?=
 =?us-ascii?Q?wsGPwcOyuqH2DhSbHN4LbcyZ0IiYAK4Df+6z6t0g3uBrNVV5P23YWROY6TuK?=
 =?us-ascii?Q?bTfO6H8MR5ljbNETgT4Tjh1/VcUlkKAbk7i3A+dvaz1NAyWitMXTiaK0qM+P?=
 =?us-ascii?Q?bxizuocav0DouNRFHK+Uuzgl4wg1Re+NH1WYMcJLS3/tJmn0Ty6opzoRB/oo?=
 =?us-ascii?Q?UL1MfmM8afZMlo7phPQNm4BMc2KJO1nFhmvzEGfr3J1hIF9FSHyVf/zL4A4x?=
 =?us-ascii?Q?cbfQFhi4K6iB1WfOslZv7UAoWko56qeKwtiC7afwoKoITL+GLchkElzIFnBH?=
 =?us-ascii?Q?fQK8Dy/I/BAe3lpGahN1WwY7HEMo9rj/sn1IA4vX34myp2M9F18MhfWOa32q?=
 =?us-ascii?Q?8U5bzXjzHXIts5Lf7MSZA3PkE1yZFGWsqBDzerHuaPHaiShvG4F66a/yY+/I?=
 =?us-ascii?Q?gh9PGGrlA3r+c5be7x0KoGo+T/yBCtdXx7JxCKFu9zbZJY+YkMhdNdhJFNcC?=
 =?us-ascii?Q?SpJ1s4OmkKF8IukZZfSHSuVQgi9HFrSVOnKb8i67yJ4d0TvE6aCtL9wOEtz+?=
 =?us-ascii?Q?M+0JSZsJZYvQCiQr6szqfDttTv9PS8hkcupO3xiqXNjisG241J5tzfn29pSz?=
 =?us-ascii?Q?+IByRGiCXibDCjSRPd3tr8V3j6NsyXcrFNanhMQczOySzHenhBx5/aZFVbb8?=
 =?us-ascii?Q?2OU952gO4r6MafaUOwi76xH2WfTGM4AQcOCpsgIUNHws3rsOsDGVSsxIteex?=
 =?us-ascii?Q?j8DPg1sLRkuuxEkOaZocemvtzkIHvDiU33qEGpPxQbbCPAZdhr+rSGzmPsok?=
 =?us-ascii?Q?erPKPiCUShFPnMfL+NZoZ8+W+syAtqy9Earwzy+dHXA+z7iI2QDAmolYd+/h?=
 =?us-ascii?Q?IhTD9bhbCzPygyeErVuXDZtdpqp0vNtdmCKlNTadrP6wC8puRd44P0kl2mYN?=
 =?us-ascii?Q?59U1K27ripMTE3j8ya/m1U2KPRw0e8nJDXqjogpz+5Zrk/HJtlGSFog0uytx?=
 =?us-ascii?Q?KcPPctQsHzalCKYJlWCjbMtFXg8pqSKZRZ1oJ89tvozrVa7MwZ4qckweN5Df?=
 =?us-ascii?Q?p4i9GYC2ezuYN6KIcUq36hTmLbiJ3n8RxqrvsbcZGNESBxqc1yO940roDRI1?=
 =?us-ascii?Q?VXKEj3YXmpWb1bv/NDW+786hC/HUYdIe2kZqpCRiEQjbI5vU3D+vd7plBlgC?=
 =?us-ascii?Q?wlKqPteoZ1SNPLNd5vpWc0mGb/ONMU5yLGHT404kj53QL+fiU8C4+xTe9tD1?=
 =?us-ascii?Q?zS8NoRKZq6S9c4kBm3L5kCxicmxaw2a80zMqEU825PApnENkq245q4d2G8cm?=
 =?us-ascii?Q?ozjg0CULBC5WRvivqMxNF/CfocViV1fmBeJ/MMNDR/216YIc5qsLzcyvRs5v?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jb04EmQuxcFU9ZOlnKOAliCdGP8+OycmRzHc2NIm/62rWg2VhDor3BRHf8EWoT+jYf885HvAyr2rw9thcqwS/K6YWWuMVLJRvUflnB6m8QqEPVdLWNfo7uLGXoPLyNFLl3rXOkuHOn4bJQaXspbfLn4ZC+6DH60ZblOfVLkG00+nMa+IZESe1aGiamh3nhw+tAshrsN/234fewRmBRYU7EDGWDE83+pw4xstZJhtG5IQEq4sKtBNwTVYGWZfUK1fiDqr2Af+S8Vx9Lzwqt1BOJ6Xn+buqbuZ9cQ+3s+m/qYCRex07Acg1B7Lsz/jeYlYrxH6aLKRorm+s9JHVl2SaHOXOgD+YxodhueeSMA8o0hsbe41NjFhKHQHD6qBe36HoPhrYbNAuN65exWScjgjgLWN0U3NUlmYnVHZ2RtZe27fJyrsF3fspIIxisfBbBDAMUeSWLkfFnsw60lU7CypThinjpWzUj3xdxDMoa1ePUpPrMsp7UQnqRZ3zF8lI6mWGDBSoXzYvW8icH2bqfNbyumvhwsB26urQeVSUW9V8YONTyd1n8jJ5dPZMG6T4Bnn4V/AphQ7Y/kbYRWJTQAZb5w4XDSTVRiEGPcumwXlLko=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ca3715-97b0-4d5c-f2a4-08ddada56840
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 13:46:48.7627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEWkCYY3jw5aTe6Cq+srSjf00VpQSKff+u/AOY1XMXwfSCUgaab0iQrDVOGdohiop1Qu7sy1YbR4O1S0SMa/WBkTTL67m3dg/2PxLS71WVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6125
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=913 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwNyBTYWx0ZWRfXzUPae8iLXvIL
 LvWR0iKXeoNvzWUUkq1F8JShPX5UFTkZENleyViBhM9F9Am4ODGHXrxBlLnua3XgW2M4XhACoh1
 xEXs+Ni0GJ3gBXTDV7KjifT7Ne7anxb9aS/gEHWOxryTYd3wHeD6ITwl/CcaTq4cgRkm0Prx5Op
 XBhUpwBw1VOOchjfwZbPMUrxPUxNWm6fB2qB+8iJop5fRaI/6vTYAAsCL8vl+9UcWtpj+1Lxwtb
 Z1Owt906MA+YdswbowledkKLn2ezOXHlsi9BB4CkVPrZPplv7Vb6zDso/4qjmFY5AJXaQW6eJRF
 9mvl4evDLOQczVvRZR0kRFbpMD/ujY2WEi0Dpa3QDu/Z5ukebgZAW6w7XJwD7Q7fXJDYrIvWXrj
 RS1a5p5WeIaPGSdPVxPOH/J/1PySQRgv7Qa/SAGdxyuhJHySJiMB9yS9oPVhQWvTqC0JyJ2G
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=685171cf b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=V9ySHPybjZri8SzVnVcA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: 1AMI2ogDHojYKzc2RQzgvHHvQXOFzvWZ
X-Proofpoint-ORIG-GUID: 1AMI2ogDHojYKzc2RQzgvHHvQXOFzvWZ
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 17, 2025 at 09:45:32AM -0400, Jeff Layton wrote:
 > On Mon, 2025-06-16 at 21:41 +0100, Al Viro wrote: > > On Mon, Jun 16, 2025
 at 08:33:19PM +0100, Lorenzo Stoakes wrote: > > > REVIEWER'S N [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRWfs-0000BU-MC
Subject: Re: [f2fs-dev] [PATCH 00/10] convert the majority of file systems
 to mmap_prepare
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
From: Lorenzo Stoakes via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, ocfs2-devel@lists.linux.dev,
 Pedro Falcato <pfalcato@suse.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 17, 2025 at 09:45:32AM -0400, Jeff Layton wrote:
> On Mon, 2025-06-16 at 21:41 +0100, Al Viro wrote:
> > On Mon, Jun 16, 2025 at 08:33:19PM +0100, Lorenzo Stoakes wrote:
> > > REVIEWER'S NOTES
> > > ================
> > >
> > > I am basing this on the mm-new branch in Andrew's tree, so let me know if I
> > > should rebase anything here. Given the mm bits touched I did think perhaps
> > > we should take it through the mm tree, however it may be more sensible to
> > > take it through an fs tree - let me know!
> > >
> > > Apologies for the noise/churn, but there are some prerequisite steps here
> > > that inform an ordering - "fs: consistently use file_has_valid_mmap_hooks()
> > > helper" being especially critical, and so I put the bulk of the work in the
> > > same series.
> > >
> > > Let me know if there's anything I can do to make life easier here.
> >
> > Documentation/filesystems/porting.rst?
>
> Also, an entry for ->mmap_prepare in Documentation/filesystems/vfs.rst
> would be good.
>
> I went there first to understand what the requirements of mmap_prepare
> are, but there is nothing.

Ack, on it.

> --
> Jeff Layton <jlayton@kernel.org>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
