Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC1ADB9B0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 21:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrAG93bZ/g/XbyY/fLTuvorc3LQmA1+KLS/TtsQ293E=; b=HeFoLsFVleGVzE/Flu2bWROcaI
	2QKpBmmyNSHR1KFD7bwE3VXpTXKg13BaCoum4h5jahqO+RIzDBCDCht2YHue/73w6zzbxE0DCjQH9
	c6OrSzJwl1v49wUFVBx2D+6ZiY6o5ZfdSONnNs3LSQqgQyOpt6VJCkZ8OyxXFjEDz8kw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRFbs-0001sn-O3;
	Mon, 16 Jun 2025 19:35:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRFbg-0001qp-0u;
 Mon, 16 Jun 2025 19:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0vX5EMBn7enV6XucRoT9/b+hV0OZHmbjwDCB6G6NYFA=; b=Usc1e4MkUH9YBoIHibYx5twiZW
 zQckGI2tmaZ5/63bR6/UtyBuU34/fAin+egAElKfqN43VJt0b09vs7bA+n7IWmxStm+WiePt9EM/L
 pqzLoIvgApkL//sIxarvq06Vpb/COVct7nLzvVlYy5RAo07gTXnZPfHGKdEEKW9ZyX3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0vX5EMBn7enV6XucRoT9/b+hV0OZHmbjwDCB6G6NYFA=; b=Ac+kZb5C3wos207Emh9o0IyCD9
 d1g/uwYwCIC1tKh5nLu1d7sV405vDEfHqq3S7eSb3ZnVIkCj6qAQeLKkTmJPtNPE3Sk/SsB1x7oW1
 kelKvuOnyEguKeiP+wiRvYnyeGEkLjyILZfnvaDZlFrDssvAVN7A0KshyoB2glM3zk6E=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRFbf-0008Jk-GC; Mon, 16 Jun 2025 19:34:59 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuUbY027735;
 Mon, 16 Jun 2025 19:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=0vX5EMBn7enV6XucRoT9/b+hV0OZHmbjwDCB6G6NYFA=; b=
 Q7W6D0iEYBtnRmr0vI+5J/nAHsLT00xA+T6U5uuzh5sdpBlJLtAvCx70swx/nUjw
 SGg5tRpQT2Wu33ZDCN4o0B21hIHrSWLM43QXzdH6wj4heaH5ZBCiSwopsVPEXEwq
 VbhDAUaxiRi8WzD5qw3SFext6f6eY2jiJ+nqOORokADAMyO8E45nLqhYu0wDyqGN
 Ir2xJ/KzFvKjCwarhP6obFiG43IAqLMdxMcVXGt6U/pZn3BYg3ZEbH3s5lWNep3f
 pgbhZUDjPR5CE+m75W3pY45JTWvljMTdOiQyjwaiKmxKLIMjUgridgbLyZS8aDCF
 ShqE25nMDqGkWjspcStU/w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4791mxkphp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:09 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55GJ6DKO025950; Mon, 16 Jun 2025 19:34:08 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012066.outbound.protection.outlook.com
 [40.107.200.66])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yhekuqt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tkjl6Jcjoni26amNMWITLUcom1sYOFXZUNKwxqVSkrov1Y/JIYCnYvLfiVKjSIzDstmG6ki2m5/VtFeIsavcvVoJsJYZk1JgqQn4qXQ0ohh68FHLK3cAXCUEQMlMT3DbM+56rEfJv3dt3vaPYGmnA3GcXwR8fTd/Vqt44tyyRmM0kewsWuGGc7ytxBscWvSQjtSpH40duGaLBvmdESGy8PuaHMdOG4+p5IeyyoKvcGk+zofjMd0N5u9JsmBpt8rxFkeuAuMoIJIQ1XA6v2gg1saq8vZ3H2aczSR7A8uGe8ixzelXvKqpYchWOQg7DoEHMAR5u/WFzPTrk9hbTAp4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vX5EMBn7enV6XucRoT9/b+hV0OZHmbjwDCB6G6NYFA=;
 b=nC75QAr7pO+vtIAowDNelQkkFiYoddGiXtrx/ywffSCGOwMn1kVq5jLyd8uOICunEqfF4L9DKK3kQF7nZ59HMe7nFt93Vsxv0dMTQc5Uu7mW9NogV+d5ktx44qnoF1zu8gKTRaAUmkR4kF/OvJmR3e99lO4eOpXsZ5NlPV0tSlJpH2BdRlGmera/9M2bk7w800X5My9GRSMLeIPELnN2MsZBEiSAc1GvTq5fd24XzI6s9p5mjpjQQm+Sjqi2iiNTM+oBLhUfXmJsBqV/cpLCflgIJ0jsG1nRmBiI3EuSNSYGQQ9+TNdpE8GQp4jGePe8K6pedehV3+0YyOdeCXHYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vX5EMBn7enV6XucRoT9/b+hV0OZHmbjwDCB6G6NYFA=;
 b=LL8jZ78ZP/7SStz4/ic2ZLMMSCvc8li4VPaSI8fwEEf96QrE/FZz0juUYAiMt9YdbJ6K7qiOfwYGNqnupp/95fR7AxT16Egnakua/u8qc8EtmRQsq3/QvLBTT7Ne3WsibzV55kZWxnBndqNGZ5V8G22xsjXACSw3cn4n5RkEvok=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:34:02 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:34:02 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Jun 2025 20:33:26 +0100
Message-ID: <30622c1f0b98c66840bc8c02668bda276a810b70.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0f6658-586f-4589-32d1-08ddad0cbfb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3KEpAR3GbKfZj7/kXL5O98WrpjT4ur77uoAhSeIzKs51YU8aF/OVGa3KLhxt?=
 =?us-ascii?Q?lDBkJc4ZaVZSFxbLgAkEoI/XhT4M11FLk7ppWSG4vXuSWltA8X5gHJ/GfINF?=
 =?us-ascii?Q?xbtqpFh8GaBoE8C8d3ou+H+po/hGfKYLZpryaaUVJfdPMvzmJUkQkKimPptP?=
 =?us-ascii?Q?pOBirnr4jTaYk6V1eA18GSRkm8oIkSVpnSnytw0/Gihf1Gyv7HuVCazQV0Wr?=
 =?us-ascii?Q?0pgD3d5VVUxPW8kZHLPDG5mJ7kJ4ABvDV0fyDDt09Ib0liwIvXWZQD2S124H?=
 =?us-ascii?Q?+dkcOaxLcO1NRO03XTkxxeuKAxJ5pS9E1lMxM18ZRUlh0sO1b8UQ/XT6TGTr?=
 =?us-ascii?Q?eTkxk5Ue3RNn+S+aM0QAyyDrFg9eUrRJVELJteatBqCk0EBrAveWy8zR+3pZ?=
 =?us-ascii?Q?CGYzqvrkRFapBnJQQf/32EMfk2h3VG4rKN9/YuwPG9nqW2RQSkR7xVlNfMNt?=
 =?us-ascii?Q?r9SU1SOaD+P8wFv4PA2EPmC8VNjnrKAfpUSzn3HNS9HFBPVfOY8XTpPaTf9w?=
 =?us-ascii?Q?Yx6Jy2lMO2/dOxmgHHJAqKtO3pNjjYhz7EAbVdGTbqYRd7LyBQUzjE0n8ViV?=
 =?us-ascii?Q?k4sCCjhKjmmGoFqhbAUkYL3QROoc+PQMH55M9Srh/IcQsiw/fe6eqSjwF2bd?=
 =?us-ascii?Q?+Inoz1q1i9G1Elh7nlZxyow9tgLrxdBE5IvYTdTwdGv5xWO/j7FIhZriA2Ks?=
 =?us-ascii?Q?mpFC9H369AbQLBCULW207sxtdbWGRGXdw9BYmBLguxlxc0Y6SS5920yxcB8j?=
 =?us-ascii?Q?posobeGYt8ZC75yl89Nl6rZ0ZzqG/nJqzovF9I/cgvGpQmtpj20ZpD1njFrq?=
 =?us-ascii?Q?J6c3ni5lOa4KeNO9+/DhzLokIZIasw/y1/J3FHHiQfVfaMNy4AZXELJ+qcSe?=
 =?us-ascii?Q?iWX13lFthqu90SvD9DqAUOFiJEacM7gBuNSy1DmSL0VNRNVaeL3ARdt6iare?=
 =?us-ascii?Q?XRANKKDU+bHO+z3QD/LW5AudoJfA5ayM4H3Upik+3tkPFG5G4Wh2IhHakFx/?=
 =?us-ascii?Q?Hr9Qdp81b+1lMshkibohgTa6RxmtREy1cbfuBB7FNMlAMHYKp9tidGacCR0b?=
 =?us-ascii?Q?Z6O7649MJA4bXaGYszVCIyGGAsA5vx6srRPr+O81WT1ZpSA29FZ99TpRILt0?=
 =?us-ascii?Q?dSUBJR3ze/eGa/AViF85B6OdTyfvCuGYLEAWisB87hJYxQzl+VtNPTc7ahQ0?=
 =?us-ascii?Q?jX4eVE+FdHJ+Eut8CWJM3y+m+pSuSnHxYjwDCq4m4D/QKFNIaCAjXWOJ4J93?=
 =?us-ascii?Q?3vCET29UecbnqhF4jTPkg/VWrePu4Ws2RnWZQwJdP9z/dlZE2B7wzOVMhd8d?=
 =?us-ascii?Q?565OKNfPdl2j9J3/Jrr+DbQ+qdrGQoz2lmUf+CRfS/Ph991O+if5/4Nx7TEY?=
 =?us-ascii?Q?ofJXNroTZxNimU/pXgjIFVD8TvByCiLw2BevGNosyxGwRo2OZQm/8LLScirJ?=
 =?us-ascii?Q?wzEQO7ep3/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IjnTfYbBQBO0yKtZihfVsXToKJY8wG3/YFPT8YpI4nSISwUllpFq3UuwDjVj?=
 =?us-ascii?Q?PDdFbPbfaPkZtaJc3iwzXaRg/3+zrej6VdxjhtHkOzLnMFYr0kPnbtL154aG?=
 =?us-ascii?Q?juYJ9WezXrhKZNUcBx298c/4ohzH0GwAtkOP2+j0b1unE/r+15vB98wQLn36?=
 =?us-ascii?Q?5JRzxCnUGL1wXGTlZ0t82I/CbRkqcDSxBoJU4aEj275q/etF08gjA1O0JYP5?=
 =?us-ascii?Q?dx9nvfHT60ZFvRQPllMQ08sxUOZxULCHFYqVUL+95qeG0DYxY50KC2OchtoK?=
 =?us-ascii?Q?y3WAmkxfAtZC+LR2RaCWN7/3jjN+8mRMEu2XE9B3CD6NRnaEm/83gsBzsFFC?=
 =?us-ascii?Q?RGqWmiTSMZ7p3GAyZ1sMfnCtf5ayrenoDXzrb+82ZwUN0BS11l0wANlZkZ/U?=
 =?us-ascii?Q?6Yrtgyx9PYwjU+tmNQFrCAvBL241nCj9MxoMPlogx0kphg4bgJef39U9OqBl?=
 =?us-ascii?Q?DwSk0H1aAzC6Ihop9+0S6GhlA0510mbWcXxEv+XPMSFoOY94/mCRGDn6bNSq?=
 =?us-ascii?Q?UPwXRPVpeQtWYAF0y+8klkUTgL9hOHzSseYsAv4kvTtSvsSEd5WgyLd5k/ZU?=
 =?us-ascii?Q?MaaFi3hQQVMmvsZ04zSKnZ7zvRJtpAVtpYKYs9QW1y7yfhTl8z+Dhpn7AHc1?=
 =?us-ascii?Q?925O/xlyiPZt4C/G0c9VIB12ChAP/pKYKWS+3+AGuPqZqepAds62TS3HGWmk?=
 =?us-ascii?Q?gBTJHHr7DdNPTayR1weK+h+ssOVemOVkAReOoietP9N8/PJaPMtvP5TsfBce?=
 =?us-ascii?Q?DdXliAdEkA6g/BuLtdLRLQQliNShR5C4/QP8aefVDx1nptihn/0mbNJQ2DvW?=
 =?us-ascii?Q?U8QU6MGrUCbd3CIYspY29d7R71e8DnmjOY1aKSrx0QC4RN4WybUG8T5zEHn6?=
 =?us-ascii?Q?k+TM8ffy0mqtYz/0pKwDbOpgRJ0VAMZSDr/XaDrFvStjmXucSfkSziSfqsch?=
 =?us-ascii?Q?/MR8lWQYGSPxR6FXFtz3srli0+WPcW3dLUn+/X/7Yw3oH2ldGT8wLMPBivI7?=
 =?us-ascii?Q?TEgzOgi1tkNGsS4yonoC0R5frYFR2drAmjYlVfdAYJ6f8AjV2gMOcUuejxZP?=
 =?us-ascii?Q?1hL7fhImpZfpIEkzs7NhaEqRu7jGCQM6QZhIiGRuzTYeqxG39ShPM1fpcv/u?=
 =?us-ascii?Q?lQgEZrv3Rscwl033hPgo5ztGEE1EEqXmh5r5Tn0ZXxtrC8HtVGWowxA+oK6W?=
 =?us-ascii?Q?2SWOwYXYr6zFXCFLVN6rudGHpFZunLxdf8dia4cnpV6QE1j4p5XN6e3jfT7i?=
 =?us-ascii?Q?r4ABoYp9o2BiReCHcGyhniYhWYBQPPkq+qC0d05a7zmWsJ9RTVDIRPOGVNYE?=
 =?us-ascii?Q?UBPoomXJpETJOYZxCErHq538ARwJg8eGOTqbn+fFYE1J9ykfZG3t+lEdaiUT?=
 =?us-ascii?Q?leS2AEzzVfv74l/hIWmG62FmvLh+N6eziDwAix2LWjOwnlB4tbcS+/Gk1Ean?=
 =?us-ascii?Q?CwcmvhOpgOsfhWOpIssLXz98ntei8lEtM4sOn6nx+VD/omASASP4stPIj323?=
 =?us-ascii?Q?roi5gt5ku6gZQTtL3hr68hSS8C+lTNJAafxmT72BcpnvQeCtZrjOvh1+v3vL?=
 =?us-ascii?Q?Jkdcsxp211UztLfhJK0nkZVVrSBbfQpKS0gfHdOgG0vwbtvuIu+aTGqMnj9Z?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: M3MYnceVArAk2y8hFq7m4j1Bcz9jhJjaCZ0xW2kpkPvPg2U9jCO5I0lnPGfS6hNM0HMAREcI8zg84T+h56ays3Y1GC8ixH/lXJwbemfetejE+Q0K6xDwKYm6283IPgbvP82e7vB2LsUjGWKRH4AJlpsieYe/ssoBHbQHsDwR39N1d2mzWkONVVqDJcIXCdQ7nyqzMjAWhfg6QwWzcHU6XLSuh5/rpBIdyM7jzfYaPYlI2NanwcdvoUKsQxbz/MlaE4hTNcdv2H1zToatIt7boe1XYvMe689XScay+r3NN+kBizhWYVA0+Nst921DN9/ZsNenUFVSjbxVp8RFmBStB9nMDXh/mxM7SYp6OnqBRArNt4UKPi7T5PJqlzQhv2TkToRA5cRgAZhK1cM05U+FkHfHXDtSr/Rdzb/73EJkinrBTyHIAv0RnuT9RpYCjhMjbWoGv2arwewd76Jr/Qd0QAPeqa1u9tg33x5d/DHAv8ze5OV+euXr/0YxkcyouppzZivglpNz0NLdxKYlQbmZ+OjJW7bEKGBywyBSoQNe9d9di1zGQvAZ/aEIOlzOYxsGvv7lF5PqtBJADF6YdjjVQUu/Xau2ph4w0/5FGdyLlQA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0f6658-586f-4589-32d1-08ddad0cbfb0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:34:02.7565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLAnw+Sfv8pbV0OlnkC4UoMyK8qcLll9APOK9/qjGi6t09w7eyZplX42jCLUjBYqY8d+aF9OG9zMpy0iHKYC1gzyXCUByTH/+uEJU/j9P7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5563
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNCBTYWx0ZWRfXxot//taULB1v
 ClYTuZF60nrFtVdCi2koj7VUZ+ZZxABL0FllwLuODm8RCAhFpzluNO/kCsqMYuVnFUSjIfFk4do
 GJFrA/zFo1Y9V+bR6vQceTbgFpxZr29kVTdg1KvkViz63P/E9fPdXci3uwZMf/KYlz4NMi3kAFU
 nfypuU7ZbkLgB5vE5OgeZ+0nC69AQ9aA5G5/bZ09ZL2Gnfu3lFuKFLUl3lJGT32axPKcr5qYk4V
 FkW6Pq7lDpqZKd3bJHY5SgOGwihyOKP1SsdBoEdptdAMYNx6/J3OE3O4Z9OVehJudJyqbkJs1cN
 d1xNTxDuudt7mfCXviKTw53EpKz38vHo1Gu9WsPlaqZI5zfAuYRLMKqqFjN1E00y68mHSFXpX2i
 x8nrjqCgsd31RR7WRCX9GrnDho5G2kpdKGjTVh0mll7SKWz6VQr1ZgK9CKDSbx82eufhdaZc
X-Authority-Analysis: v=2.4 cv=HvR2G1TS c=1 sm=1 tr=0 ts=685071b1 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=hDMBvOXnDYdnuEP8xnoA:9 cc=ntf
 awl=host:13207
X-Proofpoint-GUID: LVImPUdswCVkrubLAU7BlRPxBhcsByBn
X-Proofpoint-ORIG-GUID: LVImPUdswCVkrubLAU7BlRPxBhcsByBn
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare()
 file callback"),
 the f_op->mmap() hook has been deprecated in favour of f_op->mmap_prepare().
 The generic mmap handlers are very simple, so we can very easily convert
 these in advance of converting file systems which use them. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.165.32 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRFbf-0008Jk-GC
Subject: [f2fs-dev] [PATCH 07/10] mm/filemap: introduce
 generic_file_*_mmap_prepare() helpers
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
 Joel Becker <jlbec@evilplan.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 Namjae Jeon <linkinjeon@kernel.org>, ecryptfs@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-block@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
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
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
callback"), the f_op->mmap() hook has been deprecated in favour of
f_op->mmap_prepare().

The generic mmap handlers are very simple, so we can very easily convert
these in advance of converting file systems which use them.

This patch does so.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/fs.h |  6 ++++--
 mm/filemap.c       | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 7120f80255b3..65cffc445fcc 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3395,8 +3395,10 @@ extern void inode_add_lru(struct inode *inode);
 extern int sb_set_blocksize(struct super_block *, int);
 extern int sb_min_blocksize(struct super_block *, int);
 
-extern int generic_file_mmap(struct file *, struct vm_area_struct *);
-extern int generic_file_readonly_mmap(struct file *, struct vm_area_struct *);
+int generic_file_mmap(struct file *, struct vm_area_struct *);
+int generic_file_mmap_prepare(struct vm_area_desc *desc);
+int generic_file_readonly_mmap(struct file *, struct vm_area_struct *);
+int generic_file_readonly_mmap_prepare(struct vm_area_desc *desc);
 extern ssize_t generic_write_checks(struct kiocb *, struct iov_iter *);
 int generic_write_checks_count(struct kiocb *iocb, loff_t *count);
 extern int generic_write_check_limits(struct file *file, loff_t pos,
diff --git a/mm/filemap.c b/mm/filemap.c
index 93fbc2ef232a..e75608cbf420 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3847,6 +3847,18 @@ int generic_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 
+int generic_file_mmap_prepare(struct vm_area_desc *desc)
+{
+	struct file *file = desc->file;
+	struct address_space *mapping = file->f_mapping;
+
+	if (!mapping->a_ops->read_folio)
+		return -ENOEXEC;
+	file_accessed(file);
+	desc->vm_ops = &generic_file_vm_ops;
+	return 0;
+}
+
 /*
  * This is for filesystems which do not implement ->writepage.
  */
@@ -3856,6 +3868,13 @@ int generic_file_readonly_mmap(struct file *file, struct vm_area_struct *vma)
 		return -EINVAL;
 	return generic_file_mmap(file, vma);
 }
+
+int generic_file_readonly_mmap_prepare(struct vm_area_desc *desc)
+{
+	if (is_shared_maywrite(desc->vm_flags))
+		return -EINVAL;
+	return generic_file_mmap_prepare(desc);
+}
 #else
 vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
 {
@@ -3865,15 +3884,25 @@ int generic_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	return -ENOSYS;
 }
+int generic_file_mmap_prepare(struct vm_area_desc *desc)
+{
+	return -ENOSYS;
+}
 int generic_file_readonly_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	return -ENOSYS;
 }
+int generic_file_readonly_mmap_prepare(struct vm_area_desc *desc)
+{
+	return -ENOSYS;
+}
 #endif /* CONFIG_MMU */
 
 EXPORT_SYMBOL(filemap_page_mkwrite);
 EXPORT_SYMBOL(generic_file_mmap);
+EXPORT_SYMBOL(generic_file_mmap_prepare);
 EXPORT_SYMBOL(generic_file_readonly_mmap);
+EXPORT_SYMBOL(generic_file_readonly_mmap_prepare);
 
 static struct folio *do_read_cache_folio(struct address_space *mapping,
 		pgoff_t index, filler_t filler, struct file *file, gfp_t gfp)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
