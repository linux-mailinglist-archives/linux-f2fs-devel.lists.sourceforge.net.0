Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 657349006E2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:40:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFalu-0001wX-QR;
	Fri, 07 Jun 2024 14:40:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFalt-0001wG-5Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EIDo0SQ1izO5uBIku+emm1skSuphcYtFpGhIpZJnrnA=; b=aK6UCZ/LzENnJxiabPp6rtW82Z
 /P7TbVFRdroLzzMOyNpOEhILB4wf5dv15ZbPYxbXderVGWtdqAv5LAS10oxpdZ8zHyvEvMEj5G2xx
 o8HZpwPX4Ekv6DEiZ1RNrAb25x0XdHys1dAxBks/OI3HPlJLNYrsSHp5eye9hluy2fwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EIDo0SQ1izO5uBIku+emm1skSuphcYtFpGhIpZJnrnA=; b=VSd6smPmz6NHQYaGEK481HqI9K
 dpNRz4QcEfQ01uqSoRp2WFAAQ3r3SaaHf/0vFCq4i45np+0cRsvHqA1diUczim1zWG5rMQnlsCiu+
 HW0maA4K7c2v9V8OZflM+85jhIrSMDYtpRNhdTZeTvYnRhzVk0cHwyTSxk/FrMqIogOY=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFals-0002zY-Lx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:48 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457CuaS9015422; Fri, 7 Jun 2024 14:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=EIDo0SQ1izO5uBIku+emm1skSuphcYtFpGhIpZJnrnA=;
 b=U8g45wECVQ476nSxck3sY71bxNIEYHMJpxJU8SNzeaGTLroEK0DI9XG/SLoxsmljVHJe
 k+DDnqfhrXJOHI2oGbF9PPqQxN09DmnaSV9l+hU5MvbauJRMHm5A7UaYzTbKntX75Nvd
 KALRC/XfcNhSnieGu7RALt58NLKaQ8iNT9myPZ7R01W6NFABdjLyeT3vjysLVmLuqm45
 fBqu3UMbOlJYITolAphsZE7iLaVB71aRTIBTFn3LDHO43z2ivOH18AVbAORFB3Tx7RRZ
 4DQ32mKE84/AgeDwV4AINrr5uiwQa9b2Yy33+tBTdo/ct7WnkupuEZ+W+ncHKRhPBDW6 8Q== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjvwd3tff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:28 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457EP4Ed025197; Fri, 7 Jun 2024 14:40:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrtd30a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gE6Og0Wifp3JLsuRD/E8ephMb7D8q9VWFV2/NzyFQHcR2Hc6V06bZLwrYRhqmCXA/q6j2O0YfZAXj2BhFYVhL8SbgpChi6c93Z4LmNadE+nHlE63fsuJ4PT+ADslvhWnpDOv2I9MNAHw6yrxZkwvhj+VFb6/vXztJk+WImZA/KeljLzZSSRMfNlRhjMr5Lvx/4pw9xOqIn37RL5E/CwDh7KE4ismHXmKhTKOvpmnx4j7F1unF0vXdm9ROeDvwG6CaTfiaWpmFRPopVdwaMgtzIO1SvlZtvFcETKiwqZlZOaVyQVscBRyAcWiOluc2pKLdZ0/+nEGjEDevWUjAqwHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIDo0SQ1izO5uBIku+emm1skSuphcYtFpGhIpZJnrnA=;
 b=kr9gY3iBkNNDLXO1eebF87ckpNy4vIZszGbTsrjEKRgmVP1x9YWJPYJAbUN0dUUEU/4Qp3ER1cYVbxZuFJcjJeirenA7JKY7tnAr/HtrErd/9X4w6TMwn/eNuRgDYr5N2eBpbXCzlZ2rtpVjqPTlxONLNlOsEaAYIEcvFpRet/Jk8fPCbGXVOQZKPlux4m5Mks9YIO+ZeGebrDnyj5rURxpvnpPBlZR1Ryk2i3PodeAQC7ayCRYyBl4T7OSJVkFSdOZGUrujImmWQo8ZhtbvEOhtIkNLMnFux+yOxm3kj7ozPKhSUgHs/i9bfkRQIUx8s/hLgdt5NvNNBuZWTpYUDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIDo0SQ1izO5uBIku+emm1skSuphcYtFpGhIpZJnrnA=;
 b=xS5E7Y4Q0E8K5QPFzHNJVD7N7XEAiSJxK7Z9V6by6kxRdl/baq9ADJGB1sKh9LjQiYRnCs4DWk6UaZyLbVQJUk3k+RX+IrCBYkQFzAVpT4StUPGClSYNh6nBry9htKmO5DU/swipHWjKFqxnxFzafCLmWPjtOtdfs+GJs5YZ+bY=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM6PR10MB4170.namprd10.prod.outlook.com (2603:10b6:5:213::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 14:40:25 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:25 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:39:10 +0000
Message-Id: <20240607143919.2622319-14-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM6PR10MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8be7a8-b6a4-461e-5f28-08dc86ffc4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SR8LsNSawW+NIyt1XMa5nxZvxFBwldCxwciLE3QDgBRklTMfLo7+aX/raEYd?=
 =?us-ascii?Q?DcSpatak3v1EZxxdivu4GakwsU0eaFQXgehelGKhDfym2aDoxy696udr+jTL?=
 =?us-ascii?Q?+88jPAS86e9ALHqYqqSURqxjtmHui38LyaPkCjxghd1Bsv4Y1F1yaMKmGyV4?=
 =?us-ascii?Q?cfDyUC41qCfjtz0g7EBWM0seUsUKRUSj/WbztDEf0lItEZJyHKt1BV73IKMT?=
 =?us-ascii?Q?x1fjbQrap6Wpg+r0aLfkvXCPV1GVP18Lc4eQKsx7iYh2mynjL5auhfxXHbxp?=
 =?us-ascii?Q?KJ1iU9oXYEN2gsgNBYqJNl9rZnNB9W0KEVys2yUfXhcjGXdia9zukxrTr4Q2?=
 =?us-ascii?Q?9PEeGlJLRzqTiEJZ1s3m+Lk2YkARZXlzM6SIRPasqRMastcPpcnVMl2w1EKd?=
 =?us-ascii?Q?0+aSsX3/yMrSI/4PR0qURKyhACR9iIneLbiHBOPucDtVjM17e6PPX4u6Glsc?=
 =?us-ascii?Q?M0kSRM4uiPUnM0hmvhbM0FwFSWlkTiPKQctX+7Njao79VhV1B+fI+b4m3OUM?=
 =?us-ascii?Q?AhQh+nqy5kXLqlNqJMIn+SDH80R7yKROlCUnkcvpXiXHjSkEPJD3mTK8NSK7?=
 =?us-ascii?Q?XSfIVb2nAhnMA7yk5jAHcyBwwN/ubXzcP/LLJtM+xHRWCDYGGJUVUNdTmisM?=
 =?us-ascii?Q?ip6xY5IBKPnpbbLIXFBvx4ztPOo/xGelx/IiGSblRRN9o+r45DnseV7EZVdj?=
 =?us-ascii?Q?FqaSbMkqxmrL9TWGwaWE9wtcPaV4V6uqupxSngFrN6YjmFi3aQIIPn74iZeT?=
 =?us-ascii?Q?yv2JcEljhnfSfidl6PNhWr/mg41fCmI5H3uFRitxYGUJEOSXLIEASdbG3ec1?=
 =?us-ascii?Q?gg+xpAD03Kzks/kEA7TN4A+Dy0lYLG/8c8js0DfqWM+TLa06xkO37uo0zmP9?=
 =?us-ascii?Q?SLpT6ScE0fGpOF30PsL6AYEwL572qubPKo/QWW3CEN2FxPfFamPKw15HpZyz?=
 =?us-ascii?Q?PRPR95Q9BKtvpXv7m2x1wHMp3Ae9v15tqKp15MWIempCUu1RxgGhb5XGqZas?=
 =?us-ascii?Q?N+Ri/d6JR6GIR1uo3u9llUmkljmn2HrMdPO9OJ/dUIQMMSYMSfaSf3xUdGr/?=
 =?us-ascii?Q?TekphoeVA+6rIydk4JiUp5omQebo75E0Mbpp3c59R8TGz3P9/Njm2xFoYkHa?=
 =?us-ascii?Q?rxcsz9v5iEb6AqeODIXe+PRPhergMPOd5PP7r+XV5j1ccSpnoM8jCxhe46bT?=
 =?us-ascii?Q?3oyo7V1jLfKZKIxomSEiNhdzoTR6O85tdVFsh6z5mejUtr3DEgGu3PeBzH+n?=
 =?us-ascii?Q?hv2woU2FmwmX5DxPkE92atqIGghB9vw8WSG/ZE9BL9DdotXi4nlV3fI8xoG5?=
 =?us-ascii?Q?o1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e1GlTfZZtCmfLTTLuEBXkFhG/0CcHQt3fZ89qGaNTmoHRI2emh+J6tdma4Rc?=
 =?us-ascii?Q?Z7A3GkpLzjcELKNwK4GO0R+qhXoaml1r/LZ8mIEuve/1YmwJyzXoSe64QpTW?=
 =?us-ascii?Q?Z6f4oJFQw+O8Zt2kbCMOfC2jbZrCfsALuK/rdGjpr9lUPHo4UFgxTimN9TX8?=
 =?us-ascii?Q?C4bLz3fmVmHJPrdgdb0QGoAdF3OWF8bEzdlJCOtBMbGTo+RZqsdHg/E7QSLa?=
 =?us-ascii?Q?1RYdCHXFiWJizr5Mr3Lf/y6OCyIKHRV/mObMh8VAZxP0ITcdugAW/YWMgpZy?=
 =?us-ascii?Q?h1FsowQrt1Bc0weDl3nd0hgQmlGFk/B8gYPHa4DEMLCRrIEg6uy2+pYcxbGt?=
 =?us-ascii?Q?y7fBLtJKXbMWDy3lE2jY/jWeJSqfyida1tqOVxaxlihPXdu7ugXU1mUGuIda?=
 =?us-ascii?Q?nOhGwOG29yH20RGL8zMAAuzQUedI1lsOl0xydJMrRLvV5mKyJqYqIt8ShRd+?=
 =?us-ascii?Q?7FSetRsOcufgnAN71gIkkQaN5MxnqmJEWP2CUDUpq9y3t7XU2FGOSxMNzLfi?=
 =?us-ascii?Q?fnjfpbKY/3TZ8ezZRDfmxkshpHPKx5UYQ1EucpS6Amo6vcT9V4D0paYCSAE9?=
 =?us-ascii?Q?vRIuuP4jZ4rMLjE9S9TW4ph/nemsAKfcvFf/J007zBMwXmr0/5Ce93wetJP8?=
 =?us-ascii?Q?eZ+C8Fobh7x7Wp7RwNDQEPAJdfFaHzloBv3HJO3YHkkO8E8eIYB2JGcUkLDS?=
 =?us-ascii?Q?taj9X6x6wVRVT3EYfCe8VUcjIOXdSCLQOZgQgO7DSmN5BP80I2ZK3xP85JAY?=
 =?us-ascii?Q?m5y5O8DXcCGXd/ZufuKCuVFKGoeVDxEer7Kw1z67W5FXhO3J7ZPS9w/4YFOG?=
 =?us-ascii?Q?cZQY6uBgY0QmxlTNTO8Dn9uJigpCtDvBKQDITMsBIpdAZITPiv0xsrl8XBMQ?=
 =?us-ascii?Q?DG07+v9Ln0ezunY0k9Sq+zJx//jFZ5+ZlLpRRKeHro8VYXfH4DTHSUU7ZSI6?=
 =?us-ascii?Q?Rhyy4cZrD1iHl0nAmTqvqx201JEriF8jYVf887qu+7PxpecylOAxwPbSI0fr?=
 =?us-ascii?Q?qIGDUGu2EB6vLoDPP2vsBt7A1bT1LxqC3ee5IRSxJKcenyHieN2WRy1OmjE9?=
 =?us-ascii?Q?iXs+BIpb+6MzQ5ARtA1Snl38OZldbIAk4WntLcoj3kiahLY8yELJVBxEFMSv?=
 =?us-ascii?Q?n06g+X5oCWnkLxIVODG5Me0fKhACYayhyhVJpIolrHkhOMFIgxxUyWsII4uL?=
 =?us-ascii?Q?4pbvnmW+FVqIcaFd11w5sPkcfhE45AMnpIqupsFpMmpM+DO6jhafJdgRNHMQ?=
 =?us-ascii?Q?Oc6/5fBHtYI+kznLCp4NARwWINHYoQBa1xWJdFggf5s3PVVOrPtf/fRc/7YM?=
 =?us-ascii?Q?/av5uhdrRaCvvxHe7Dvezn9TvxljRze8AJgEqapvwNv3vsx29bl+9XLZmK1s?=
 =?us-ascii?Q?HkHBmtx8vzF10RxpiWTuf2mhjwVL72u6tG9iGBgEPH3CMtIzcjmWFAlA4dnc?=
 =?us-ascii?Q?rnQ2DQG0quKIwTRM5pNVL2/ITY1UzRRLWhZAjTt1S4jlnjDB1Ynsyr+wp+oF?=
 =?us-ascii?Q?RFvqRCYDg7BlGGdrZxwH3XGKRDn2EHdmml5nKMN3gEUkdaxhgLNJIVLU25T9?=
 =?us-ascii?Q?8lRL/s1+dfrMfDdy5v4gJB1Ty08jX4WPiqLhr0aR8LJr2wJZni8U1krzT9CV?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fp7ZxXm0PBF2U52+xaiCDFDezR7XxEl+eVy1kKFq3UAuVAuiEDVPRR3KelLB+9CWqxPCVNvPB/DXN+WKfKr3Q/eW+YMoAik4cCeZNytInwkrz2G77XgxosXQHeBe2NEKN21FPu0S2qM3NGt1yR2l71icSply9mdcWmylmJA+wlig9PEBBz4YqmdQFz6dvDrF6STu4fPhEbBwgjnWbMwEnY+A7bM34MchG3WM5XSYDhwd1UOAc3t06861RCn4AAYljUg9YPmuiaHJB8iFBji2SvsEZ1lxP7VBwTx2bfMzEst8tLJ+XM4TNJFn+yjP+iZR21CqqPC3OIJzdQoNgRZ8Eom3t8fThw8T128g7673TrSV8ki+zwz+k1N52G/WaTQUC2tT1IF+UFdSU6KR2ygiB99pGcHrEQTeVTs9l75w7OphpjsVzNlnHd2eq17FBSDD926QAVupjVNJ1aqIRWv0kmHkplmvZfzzphxF0tMySkF/D4qLrx2JUpyOy9Q2veYKZMBGuYWImNlrO0mV1dhpLz+MgJ4F+0dEfjfSsRZARpflVR/D+lnt3+G1iZi0XEfdEAQ3VrCUMI+pOHi3xWZ8yQqi+Cdo33uP8DGkdCwaSXQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8be7a8-b6a4-461e-5f28-08dc86ffc4ca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:25.7514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LipdKFcO/yFUEWdRB/QchvHPziRFlh0SYhJAIyj4+bNTh43E1ajoBkjguUV9v3RQNzw4rk6b035m3PAFWb2yEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-ORIG-GUID: q1h5pnED6cu46JBB9GCxmVOfteMLV4Z9
X-Proofpoint-GUID: q1h5pnED6cu46JBB9GCxmVOfteMLV4Z9
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For when forcealign is enabled, blocks in an inode need to
 be unmapped according to extent alignment, like what is already done for
 rtvol. Signed-off-by: John Garry <john.g.garry@oracle.com> ---
 fs/xfs/libxfs/xfs_bmap.c
 | 33 ++++++++++++++++++++++++++++----- 1 file changed, 28 insertions(+),
 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in sa-accredit.habeas.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.177.32 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFals-0002zY-Lx
Subject: [f2fs-dev] [PATCH v4 13/22] xfs: Unmap blocks according to
 forcealign
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

For when forcealign is enabled, blocks in an inode need to be unmapped
according to extent alignment, like what is already done for rtvol.

Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 fs/xfs/libxfs/xfs_bmap.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
index c9cf138e13c4..2b6d5ebd8b4f 100644
--- a/fs/xfs/libxfs/xfs_bmap.c
+++ b/fs/xfs/libxfs/xfs_bmap.c
@@ -5380,6 +5380,20 @@ xfs_bmap_del_extent_real(
 	return 0;
 }
 
+static xfs_extlen_t
+xfs_bunmapi_align(
+	struct xfs_inode	*ip,
+	xfs_fsblock_t		bno)
+{
+	if (xfs_inode_has_forcealign(ip)) {
+		if (is_power_of_2(ip->i_extsize))
+			return bno & (ip->i_extsize - 1);
+		return do_div(bno, ip->i_extsize);
+	}
+	ASSERT(XFS_IS_REALTIME_INODE(ip));
+	return xfs_rtb_to_rtxoff(ip->i_mount, bno);
+}
+
 /*
  * Unmap (remove) blocks from a file.
  * If nexts is nonzero then the number of extents to remove is limited to
@@ -5402,6 +5416,7 @@ __xfs_bunmapi(
 	struct xfs_bmbt_irec	got;		/* current extent record */
 	struct xfs_ifork	*ifp;		/* inode fork pointer */
 	int			isrt;		/* freeing in rt area */
+	int			isforcealign;	/* freeing for inode with forcealign */
 	int			logflags;	/* transaction logging flags */
 	xfs_extlen_t		mod;		/* rt extent offset */
 	struct xfs_mount	*mp = ip->i_mount;
@@ -5439,6 +5454,8 @@ __xfs_bunmapi(
 	}
 	XFS_STATS_INC(mp, xs_blk_unmap);
 	isrt = xfs_ifork_is_realtime(ip, whichfork);
+	isforcealign = (whichfork != XFS_ATTR_FORK) &&
+			xfs_inode_has_forcealign(ip);
 	end = start + len;
 
 	if (!xfs_iext_lookup_extent_before(ip, ifp, &end, &icur, &got)) {
@@ -5490,11 +5507,10 @@ __xfs_bunmapi(
 		if (del.br_startoff + del.br_blockcount > end + 1)
 			del.br_blockcount = end + 1 - del.br_startoff;
 
-		if (!isrt || (flags & XFS_BMAPI_REMAP))
+		if ((!isrt && !isforcealign) || (flags & XFS_BMAPI_REMAP))
 			goto delete;
 
-		mod = xfs_rtb_to_rtxoff(mp,
-				del.br_startblock + del.br_blockcount);
+		mod = xfs_bunmapi_align(ip, del.br_startblock + del.br_blockcount);
 		if (mod) {
 			/*
 			 * Realtime extent not lined up at the end.
@@ -5542,9 +5558,16 @@ __xfs_bunmapi(
 			goto nodelete;
 		}
 
-		mod = xfs_rtb_to_rtxoff(mp, del.br_startblock);
+		mod = xfs_bunmapi_align(ip, del.br_startblock);
 		if (mod) {
-			xfs_extlen_t off = mp->m_sb.sb_rextsize - mod;
+			xfs_extlen_t off;
+
+			if (isforcealign) {
+				off = ip->i_extsize - mod;
+			} else {
+				ASSERT(isrt);
+				off = mp->m_sb.sb_rextsize - mod;
+			}
 
 			/*
 			 * Realtime extent is lined up at the end but not
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
