Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E5ADB9B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 21:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piVoqIbEYvwxeI2rRrY70boXpEEtf06jLD9jBAfEdhM=; b=hJsTfo5auMxuc7ZxqT600hvN6D
	nizQ2YamTtedZiOGKrHKtut37aUKA6myxXBYi7SN4B2Ipf68fVf5vaaQM5+77c46QXXIQJL0+8K4+
	5nydHv7BFc9aTjgbuMjKZBmFUTp3r0OxwRS+FIX9FcIbFcRiKvmJKT9l3qjygj4lJl5o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRFc6-0002up-Ud;
	Mon, 16 Jun 2025 19:35:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRFbq-0002rX-7j;
 Mon, 16 Jun 2025 19:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k+2aiYLoMA/bjfBM9WinJX4HBnMZDqACvqdy/S9xPiw=; b=SxMhbVL80UAgX8ZmMleou0P3nj
 e7I+KkNVdIPz3wbHgobqpSvRfUHajmrsrV5EMhtkxqYIz21JIDu3D29fakvGEO5ZyzfiaJjo35Akf
 LswOZkvvr1DLIc4g4T69cN5PK4jyZw6NF8gp1mbB6sCGT8btjVuEbFj9qatOP9qrnPsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k+2aiYLoMA/bjfBM9WinJX4HBnMZDqACvqdy/S9xPiw=; b=P5fx9RzD0vWiYS+zMzrqBEYnIH
 lYd916xP/wGD2Zwjgr2zRok7/UcGPG5et+6qNYjYZHHswpREJmjQUJm862bASq/yypkhU6offTCPb
 5+Fd6m8mQeZ10io0f2GhoQcyKHSOkAFjSn+oaPL6RrPf8aEsbd9ms5rajblb7sdCyHkU=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRFbp-0008Ky-0K; Mon, 16 Jun 2025 19:35:10 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuXdE006694;
 Mon, 16 Jun 2025 19:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=k+2aiYLoMA/bjfBM9WinJX4HBnMZDqACvqdy/S9xPiw=; b=
 MSmDAAoV+UCvPJaJwac/aIhB+3jBaoHjZo99NjuPtt3CKax4sTCGFm51EtheIOxs
 I44nXTbo+dstCWkTSB0eh63HBerhnuPt6ul+Z9eLDnfaHctdSwsu3vCQ7g5zqhsp
 wF4duWbIYJPvlHcnVAPa9Y7EAdCHgoi+YkBLPapDs7mMdIPfe6YMg2t6M7mf8S9K
 aMGJSpgJ2ESEhDtZ8qmbrNKrT968JoCnbby3qaoXH1azHlRvQnhQX/Pahf0gooh1
 vzIXSlBhb/6DisJI+xxVabwOTAbw35FGOyfVQZFWC2Z4Ydt9Bmnv0FnXYGdx1/Se
 ckCwFKBS0RbHfpO/sgjnBg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900euq9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:17 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55GJ6DKX025950; Mon, 16 Jun 2025 19:34:15 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012066.outbound.protection.outlook.com
 [40.107.200.66])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yhekuqt-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9OgYxA09RWwyalceN7hQHLgoyXhTXagI9ql+JOWPqp7ehkzphs4Co69Wa2OYN/kqjrs8ScFrWEjBwm3LDHRava5oGIMCs4r/SNh5W49M/M0C7gEWGkWuIp+/XcbTTDdJtydFiq8GNwhpQEwe/Kmn9+kk6FNhc8qtRRzdk4JLHzj03Vr/yHCX4VjjV84xgKGeNAfrBsdtCRkehvhjRNgLW2evbGHFIA0nAzn1pLEjx288wVClAzBPOCidjDieNMldPL5EQtJhC08ryb3OrzOPAbMlqSnnDaMTsvTOS5r5ABhYHhPP2Jfix/P58U0AU2t/zb0d2bbfxhnHyHQ6TXIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+2aiYLoMA/bjfBM9WinJX4HBnMZDqACvqdy/S9xPiw=;
 b=Q/7D0BjGY2CGQ/qLo7+3txEF0cc6VBQFf/IK+ilJqhFGA/2ROFbALj0xWwIYQtfeZ/HIBEb4j+cGN4BsyMkAPN6ONtTYZuKLJB7qpPlMilTm5DuDrzfENy9e1L26QA2vHO8cNMQsmbAGdB/Tnh7mJgcdUxlN9ttzLUz34Br22jgQM45tER7380kg+QiqwFG8aowREWLuplkQV38ABbmyFdtPFnCUe5zA0hPUtNWmrLX86DJo09YxnLwm6fH9O3Poyem4id8SNysP7XDvQiO6e6OlNl2P1vXMfQN9ANaklVpJD47XwELUeQ4Clit+uuqgKhrDSTiWgG/+LI3Fec5OMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+2aiYLoMA/bjfBM9WinJX4HBnMZDqACvqdy/S9xPiw=;
 b=maCVS8h9iVS4skJnOgKq0sR70kfzyGAvHti21mNHliHFpaNeJlS4Axb7vfM+WA7w3WJCV9jtyjXGJK6h6awka6RsgvpH4a9XV92yN9pfxOB5C6MfH14mxe/p0bb5pODZ0j1i87mEW4lVteByHyw8IQ7d2cRirJiP/96Vd7IAq9A=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:34:11 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:34:11 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Jun 2025 20:33:29 +0100
Message-ID: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LNXP123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d3187b-9492-498c-5afe-08ddad0cc4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lq/JXuxcIUddMc3f3nfMDJYQRYuM/5OHW/aBCA2i4C3dIfvaaUsC7Iabcxzr?=
 =?us-ascii?Q?IHbGfMnTteZa4Of7/LP6YvzrpfGYHjX7kG7MJ/pSnzZaYmcr8VjHKHasfW+h?=
 =?us-ascii?Q?5Ce03+Io0/WSm7vJqoFnxsYiQgbbgPyR2/wnVVRDu17KyQJ9BrTsEzQd3Qiw?=
 =?us-ascii?Q?bLQDUwLTw/Tc5B10tLhgELCcqqZwg1T1IEQMgWybZgbuuWKnl2o07fJbGKj1?=
 =?us-ascii?Q?0tLSjUdrEiGXF4hksAryUBgWUjVcyfd6QnkJ93/nGIxJZvpkMmmkjvkGTr+2?=
 =?us-ascii?Q?qV9ARagzMWfRzL/bV3JIETF1T1lMR1YUaqEKLUEMETmV78uMhnPInxCD8JKQ?=
 =?us-ascii?Q?ub++xBgNSYKFdA8J3ctiqUQWzZuab1YwZ9nD+qvPGqNKIrCdGM9i1CVIcJby?=
 =?us-ascii?Q?jenPzyPHJxpcfDli4XApFQxVnrTwqXITZ/Rq+Y6CzhujaX4DoCLqPXPp9jJ5?=
 =?us-ascii?Q?k0mC9ZVul7toJxGb73CZsJ+48dwCOVnxvD6WH5QXO8diL6eaPol/cHxSsHBj?=
 =?us-ascii?Q?R2dLn71ulR1P2ycv7kxCb1LDPce/iWojSIl83oFx3hAOld3jndY0q4w3d0R8?=
 =?us-ascii?Q?7rVqJVAtdcLeNTsJpsKP/G2f81YhHblT89hcmkATEES3Mc5CfjxLkFwP6LWe?=
 =?us-ascii?Q?N8u4qcNdQ+V3/skzdMRMEjEFbnlJqpk+ecRi37fxUP2obh1pZ/neUpP61HE+?=
 =?us-ascii?Q?lhXbcHg3/1bUkL2Y34R9i55k1ku1KcXAC88XpfCd7CISk6FJZoM6wfE5Uhxy?=
 =?us-ascii?Q?KD/RC1OjBlawjMLVrbRLc2Q4czfXRH6YrvbFbvvAlJvDDnIQp78LeeCwBiEZ?=
 =?us-ascii?Q?9XZUJgPCdCuXa34EwfPAIiWMseKZGkNjnIUJmRhfujx3lUh9gltrbxb9jHjN?=
 =?us-ascii?Q?eMT/Tit54oW5t+83LFNCKHNZDfr1klq4azrJF4GlO7X7t8/pV1aIiJMyCxjP?=
 =?us-ascii?Q?WeIg1zx91hozlRaFgmc8jiAaVcTDHv7w6HTBPqrujt/PWC/fec5npy9X+Twy?=
 =?us-ascii?Q?oqLYS1MuuXh0mBorpU3yKALyhpOvk3jbDv/ovPrX8IUlF3TI9hmmBaA6lpQw?=
 =?us-ascii?Q?o1TW0CXD7EhzxaPdQQWvMkCAB1VwFT1cWlllVAEdZLy8SRCgssb8+sCzaJwf?=
 =?us-ascii?Q?8Mx9bm0iJYrSLoJ9HO+orOW04QCMzTI0WbwAtHLRPLP5EEcziga19qUy6UKr?=
 =?us-ascii?Q?fl9Iz36GrDTTRaiUvA3Io2xtTh2cx03olLhc/o+By62JsFQBStJZntJHjtow?=
 =?us-ascii?Q?KrOcVpHIlg9t6ubBZ3LGzhRuZhgwlaMRCGs2RKjv6fHfBBrMjWyakpPTxxzy?=
 =?us-ascii?Q?SX/DZO4o1Su4odh8OZJ/yLHC315tUOCtedrYLF0DIPO4d1wkkER2/tY4izKY?=
 =?us-ascii?Q?uxrCwtfOq6OtoKWNkrXneKdIroclRzvxydhveqfU3HGP+kCexj+PAj7EiJt8?=
 =?us-ascii?Q?PzM/YMEeH7I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kbRRHJVmGk1TU+JFgb2z8lLtiTkzeH329qdGqd0Sym9XDXemqcxFekJkYQyx?=
 =?us-ascii?Q?i8C0wfhmmtH2rWZHKiGGDoHAk27dcLMC84nfNGrytgjztJ9eOyAFBFN19THy?=
 =?us-ascii?Q?rCpfyq8m5ubHsYH6wcmOE5cuicIPffSPecdp51uFOjAtq+sM4MKAIII10m9i?=
 =?us-ascii?Q?3Yuvbx9sSMAJaPMQyci/XGNKtqmgFdHKevtvFZgObsI4Sk30NFBwqi66Exo7?=
 =?us-ascii?Q?U038mLzkH6JkDoUh5CrxjHwEW+I3O0UrNbjBLQAdsQwSsKH0K28rLfWiti7+?=
 =?us-ascii?Q?sGt01BbPp4xqn8TnTbR02U6sz8ItVgtiunLxn5+l6plwZ8Hqz/5FonD/2JgK?=
 =?us-ascii?Q?/qGsKCcE9uNjFxfYsacXroiDR9bXjc9jL1OMFqpD1B1E2UqKYiQMT2KS3YKj?=
 =?us-ascii?Q?dQLmzKDeCzWo2TKsUCCvSt/B53+86MVlRQqs7ZA50YoN7zcUH9U0bjLGlD7u?=
 =?us-ascii?Q?IYARcqQsnK1GAAkZol1EEkdXsvWllsMnISugA38bCmnqURzGCs6zxkt5Nu+H?=
 =?us-ascii?Q?Cflh+5wYHJu4UFHFKoijaBRl/w03uL6MYTntw7uhWBXupJzQYApAJReGY57X?=
 =?us-ascii?Q?fMAjxR5MTUK1oIA4TEfH7NCQVdIxhkgc0HoohDXZleLVZ+xLTr43tPhuTMZS?=
 =?us-ascii?Q?h7HPzYcxw0ETiLCxmExFyjlPW/xPhvbHqGc1uv26UhL4YRhiTiJSlEjMUubq?=
 =?us-ascii?Q?sfmw5z+rewtHRyu0fgPZSpEhLIUN2AcExkMttyrIc/4kPyf48m8jCb94wE6K?=
 =?us-ascii?Q?0fxPALsXmNBxTNOqYTWG/TP+7XSKFNPAL+Te3ZhVwmNmgecp0hEX1I35hK18?=
 =?us-ascii?Q?0FdrlWaWuzyeHrb6hhYy8ychJZ3yh+eWOhLtsvb3y2c9sHYC0jFfdcMcNv8L?=
 =?us-ascii?Q?uR0T78b3KFpBQbB0l0PdQfaQL32tq9opd0r6hvXfNqe5eV/R/BhCTzJ4wxxQ?=
 =?us-ascii?Q?n0E0RWtKvCfECgWc/fdPs9Yr1jwWFaoMfLIXF7CSxEY7didWFfNIr8Talxos?=
 =?us-ascii?Q?aG9OOhbun8hfUUBvyp6oQmrtOA0GGRmMKx4RMF9yTR6Km/Qn++VbaTWv7BmU?=
 =?us-ascii?Q?xxFOCpBp0CuDDc+BFizdf8vKg7tqNwX3N+TGafuXmG4H6Vtk/cMebF1p+Hzy?=
 =?us-ascii?Q?T5cV26OSmMDkNrLXq/vGY2QmUXmWHCoq/Qhgopl/szST8OLqlJzb1UgymIcc?=
 =?us-ascii?Q?3sSXI9nsf9TYTKRasFTQCaywNNg6jAnuH/cMUd4Sbd0uyvYBqyhx8jMwb5hC?=
 =?us-ascii?Q?SH1Vf8JJzB5nGjuNmUl1qzfK98DsxS/mLNXM+EWvrehwmXysT+SRHutoWV1b?=
 =?us-ascii?Q?ZcH4MGMkotZi4NCiDP51tTVmyydb7al/uXVZwddA7TfRYqU+Og2+e8I2Ypro?=
 =?us-ascii?Q?hH3d2YBs4SA0O+fVVLrCU2u1lvntkuk/dQI9c2GgzX3scO1sv/Rx9RrfUySf?=
 =?us-ascii?Q?CMaHW9+otdoY6jNWwVbCYnSr4SNs0YismOE4x5xaJKvGM3uctHnjQ+v9byf6?=
 =?us-ascii?Q?nLMecCWRm1J0hGZRsCVRSR9U4M55rRC213/qRubSxDqgo28vOiW2QGkPRBqS?=
 =?us-ascii?Q?gYcaMErpV2yQ1o3kkW4YeyrrG8/dW+6fG52IHfJOdJoy0ofQKDKCmUHOhgLf?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0cKv79Ihlmo3Xy0CRCQfLEnMNyrg85/76pSxNshmR6emerNUE8pn2K10Zj0sGnRBMVSAZ9pq3qyU168HgnXupvlVnVxLTUp1Zltp3OuvBLdBV9h32PiauoHykVf/koBj0MpPm2fmMz5u2a9dhkeX2PEZAEmVl62BHwNjc1pbXLdfRpL1N+JqkLYRNeI5Mh3AjkzMoEuaz1NXi3oq1nmNwwPIyZHAZ+JvRUte2KhwdAUCb3uFhvbmO0JpqrMQD5PsSJUaaxkPJDMGh3m9feBydj7tom5DTOIxHH2+cCJrMzrNLrlEnQ17JUBm1m0kKWv3TitdU2Eh7CWkkmba93knOMEralmpmkUNShjfcwqaTgdqXqdXSpevPxDDeajgSq1sOaZvh7b8+oEVTebuhCpUpQ4PyKEorewq6+LGAGjFdc+ezbMt3naLm/BOMmygq5D7JvFl6gN3YgSJCGxthwJX/TxAC+0z5HoDUE+Kn+0iZvOmbYzuUcNpl5vsRZIeM1UsoMBPzF0ZBkdvt4Mh3A8shb7PC74xIjMA20FTPuFLcUVCt3LzU/CGMAMDB7RdnZAbcwOniWsbfYIJnoaRqjfI9Jfkf783Ojrt1+GVkWauav4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d3187b-9492-498c-5afe-08ddad0cc4a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:34:10.9629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47fkr0TaSvubZuUP/GrUap0CT9AGc2QfdPtolL12EpZCazESC+Vx3CG+udzLsy7vuGHgTSaSL25nf5Z1dWMbM/cyoEW+W9XIosAErD7F/rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5563
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNCBTYWx0ZWRfX3b5VMDvE1NZD
 NB9W+4mfdO03hH8+gv2jxInx0CFwC9DA08tJc4R7RQwA3V+jT+krBfVn7GrFJnOWGX1N6PfFD/c
 j2c36KPtIpp/mH07iJTWjMfjxvfGTu3HXnaUCCwUi6ggQHH724N5rcEJujSAXy9E8GeyCRvSfAs
 UCEni1sKneIaeYg0m+dRXglluG1uw8uK4H52hGZds9e0wvpR6mY1zG47P2MTyn6LGuaNkHJibgW
 hnaQNRzDILfa/OS/aBUGqyFrbVtasl/Ad3y4KrUCmVhOnLjVlVaMhtgSfzOaDmqBEk7TXQlabDG
 oxkO+CG7rjUJjtrhnqMOrNP251s89/ZicLFUF3HEMoU9+8ZwqCdGQ6cJYXsCpoH3ZHuJXvLpKpR
 wotWcURqLsMBWg+ZELzbVJQU4/eEQjZPKXVBCfqO3m4ifCRpvECecVJY4NzUVmAKmP1rRJcY
X-Proofpoint-ORIG-GUID: TdGYHk6aJx7_ghJ_K5k9ksQM6Ndj98fx
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=685071b9 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=SMoXfSvzbREBZZtL5eoA:9 cc=ntf
 awl=host:13207
X-Proofpoint-GUID: TdGYHk6aJx7_ghJ_K5k9ksQM6Ndj98fx
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
 This callback is invoked in the mmap() logic far earlier, so error handling
 can be performed more safely without complicated and bug-prone state unwinding
 required should an error arise. 
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
X-Headers-End: 1uRFbp-0008Ky-0K
Subject: [f2fs-dev] [PATCH 10/10] fs: replace mmap hook with .mmap_prepare
 for simple mappings
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

This callback is invoked in the mmap() logic far earlier, so error handling
can be performed more safely without complicated and bug-prone state
unwinding required should an error arise.

This hook also avoids passing a pointer to a not-yet-correctly-established
VMA avoiding any issues with referencing this data structure.

It rather provides a pointer to the new struct vm_area_desc descriptor type
which contains all required state and allows easy setting of required
parameters without any consideration needing to be paid to locking or
reference counts.

Note that nested filesystems like overlayfs are compatible with an
.mmap_prepare() callback since commit bb666b7c2707 ("mm: add mmap_prepare()
compatibility layer for nested file systems").

In this patch we apply this change to file systems with relatively simple
mmap() hook logic - exfat, ceph, f2fs, bcachefs, zonefs, btrfs, ocfs2,
orangefs, nilfs2, romfs, ramfs and aio.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 fs/aio.c              |  8 ++++----
 fs/bcachefs/fs.c      |  8 ++++----
 fs/btrfs/file.c       |  7 ++++---
 fs/ceph/addr.c        |  5 +++--
 fs/ceph/file.c        |  2 +-
 fs/ceph/super.h       |  2 +-
 fs/exfat/file.c       |  7 ++++---
 fs/f2fs/file.c        |  7 ++++---
 fs/nilfs2/file.c      |  8 ++++----
 fs/ocfs2/file.c       |  4 ++--
 fs/ocfs2/mmap.c       |  5 +++--
 fs/ocfs2/mmap.h       |  2 +-
 fs/orangefs/file.c    | 10 ++++++----
 fs/ramfs/file-nommu.c | 12 ++++++------
 fs/romfs/mmap-nommu.c |  6 +++---
 fs/zonefs/file.c      | 10 ++++++----
 16 files changed, 56 insertions(+), 47 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index 793b7b15ec4b..7fc7b6221312 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -392,15 +392,15 @@ static const struct vm_operations_struct aio_ring_vm_ops = {
 #endif
 };
 
-static int aio_ring_mmap(struct file *file, struct vm_area_struct *vma)
+static int aio_ring_mmap_prepare(struct vm_area_desc *desc)
 {
-	vm_flags_set(vma, VM_DONTEXPAND);
-	vma->vm_ops = &aio_ring_vm_ops;
+	desc->vm_flags |= VM_DONTEXPAND;
+	desc->vm_ops = &aio_ring_vm_ops;
 	return 0;
 }
 
 static const struct file_operations aio_ring_fops = {
-	.mmap = aio_ring_mmap,
+	.mmap_prepare = aio_ring_mmap_prepare,
 };
 
 #if IS_ENABLED(CONFIG_MIGRATION)
diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
index 3063a8ddc2df..9c2238edc0e3 100644
--- a/fs/bcachefs/fs.c
+++ b/fs/bcachefs/fs.c
@@ -1553,11 +1553,11 @@ static const struct vm_operations_struct bch_vm_ops = {
 	.page_mkwrite   = bch2_page_mkwrite,
 };
 
-static int bch2_mmap(struct file *file, struct vm_area_struct *vma)
+static int bch2_mmap_prepare(struct vm_area_desc *desc)
 {
-	file_accessed(file);
+	file_accessed(desc->file);
 
-	vma->vm_ops = &bch_vm_ops;
+	desc->vm_ops = &bch_vm_ops;
 	return 0;
 }
 
@@ -1740,7 +1740,7 @@ static const struct file_operations bch_file_operations = {
 	.llseek		= bch2_llseek,
 	.read_iter	= bch2_read_iter,
 	.write_iter	= bch2_write_iter,
-	.mmap		= bch2_mmap,
+	.mmap_prepare	= bch2_mmap_prepare,
 	.get_unmapped_area = thp_get_unmapped_area,
 	.fsync		= bch2_fsync,
 	.splice_read	= filemap_splice_read,
diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 8ce6f45f45e0..06bd30b35b95 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1978,15 +1978,16 @@ static const struct vm_operations_struct btrfs_file_vm_ops = {
 	.page_mkwrite	= btrfs_page_mkwrite,
 };
 
-static int btrfs_file_mmap(struct file	*filp, struct vm_area_struct *vma)
+static int btrfs_file_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *filp = desc->file;
 	struct address_space *mapping = filp->f_mapping;
 
 	if (!mapping->a_ops->read_folio)
 		return -ENOEXEC;
 
 	file_accessed(filp);
-	vma->vm_ops = &btrfs_file_vm_ops;
+	desc->vm_ops = &btrfs_file_vm_ops;
 
 	return 0;
 }
@@ -3765,7 +3766,7 @@ const struct file_operations btrfs_file_operations = {
 	.splice_read	= filemap_splice_read,
 	.write_iter	= btrfs_file_write_iter,
 	.splice_write	= iter_file_splice_write,
-	.mmap		= btrfs_file_mmap,
+	.mmap_prepare	= btrfs_file_mmap_prepare,
 	.open		= btrfs_file_open,
 	.release	= btrfs_release_file,
 	.get_unmapped_area = thp_get_unmapped_area,
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 60a621b00c65..37522137c380 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -2330,13 +2330,14 @@ static const struct vm_operations_struct ceph_vmops = {
 	.page_mkwrite	= ceph_page_mkwrite,
 };
 
-int ceph_mmap(struct file *file, struct vm_area_struct *vma)
+int ceph_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *file = desc->file;
 	struct address_space *mapping = file->f_mapping;
 
 	if (!mapping->a_ops->read_folio)
 		return -ENOEXEC;
-	vma->vm_ops = &ceph_vmops;
+	desc->vm_ops = &ceph_vmops;
 	return 0;
 }
 
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index d5c674d2ba8a..41b8ec33e864 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -3170,7 +3170,7 @@ const struct file_operations ceph_file_fops = {
 	.llseek = ceph_llseek,
 	.read_iter = ceph_read_iter,
 	.write_iter = ceph_write_iter,
-	.mmap = ceph_mmap,
+	.mmap_prepare = ceph_mmap_prepare,
 	.fsync = ceph_fsync,
 	.lock = ceph_lock,
 	.setlease = simple_nosetlease,
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index bb0db0cc8003..cf176aab0f82 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -1286,7 +1286,7 @@ extern void __ceph_touch_fmode(struct ceph_inode_info *ci,
 /* addr.c */
 extern const struct address_space_operations ceph_aops;
 extern const struct netfs_request_ops ceph_netfs_ops;
-extern int ceph_mmap(struct file *file, struct vm_area_struct *vma);
+int ceph_mmap_prepare(struct vm_area_desc *desc);
 extern int ceph_uninline_data(struct file *file);
 extern int ceph_pool_perm_check(struct inode *inode, int need);
 extern void ceph_pool_perm_destroy(struct ceph_mds_client* mdsc);
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 841a5b18e3df..d63213c8a823 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -683,13 +683,14 @@ static const struct vm_operations_struct exfat_file_vm_ops = {
 	.page_mkwrite	= exfat_page_mkwrite,
 };
 
-static int exfat_file_mmap(struct file *file, struct vm_area_struct *vma)
+static int exfat_file_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *file = desc->file;
 	if (unlikely(exfat_forced_shutdown(file_inode(file)->i_sb)))
 		return -EIO;
 
 	file_accessed(file);
-	vma->vm_ops = &exfat_file_vm_ops;
+	desc->vm_ops = &exfat_file_vm_ops;
 	return 0;
 }
 
@@ -710,7 +711,7 @@ const struct file_operations exfat_file_operations = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl = exfat_compat_ioctl,
 #endif
-	.mmap		= exfat_file_mmap,
+	.mmap_prepare	= exfat_file_mmap_prepare,
 	.fsync		= exfat_file_fsync,
 	.splice_read	= exfat_splice_read,
 	.splice_write	= iter_file_splice_write,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f2a8..7af2b49b7e8a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -532,8 +532,9 @@ static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
 	return -EINVAL;
 }
 
-static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
+static int f2fs_file_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *file = desc->file;
 	struct inode *inode = file_inode(file);
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
@@ -543,7 +544,7 @@ static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
 		return -EOPNOTSUPP;
 
 	file_accessed(file);
-	vma->vm_ops = &f2fs_file_vm_ops;
+	desc->vm_ops = &f2fs_file_vm_ops;
 
 	f2fs_down_read(&F2FS_I(inode)->i_sem);
 	set_inode_flag(inode, FI_MMAP_FILE);
@@ -5376,7 +5377,7 @@ const struct file_operations f2fs_file_operations = {
 	.iopoll		= iocb_bio_iopoll,
 	.open		= f2fs_file_open,
 	.release	= f2fs_release_file,
-	.mmap		= f2fs_file_mmap,
+	.mmap_prepare	= f2fs_file_mmap_prepare,
 	.flush		= f2fs_file_flush,
 	.fsync		= f2fs_sync_file,
 	.fallocate	= f2fs_fallocate,
diff --git a/fs/nilfs2/file.c b/fs/nilfs2/file.c
index 0e3fc5ba33c7..1b8d754db44d 100644
--- a/fs/nilfs2/file.c
+++ b/fs/nilfs2/file.c
@@ -125,10 +125,10 @@ static const struct vm_operations_struct nilfs_file_vm_ops = {
 	.page_mkwrite	= nilfs_page_mkwrite,
 };
 
-static int nilfs_file_mmap(struct file *file, struct vm_area_struct *vma)
+static int nilfs_file_mmap_prepare(struct vm_area_desc *desc)
 {
-	file_accessed(file);
-	vma->vm_ops = &nilfs_file_vm_ops;
+	file_accessed(desc->file);
+	desc->vm_ops = &nilfs_file_vm_ops;
 	return 0;
 }
 
@@ -144,7 +144,7 @@ const struct file_operations nilfs_file_operations = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl	= nilfs_compat_ioctl,
 #endif	/* CONFIG_COMPAT */
-	.mmap		= nilfs_file_mmap,
+	.mmap_prepare	= nilfs_file_mmap_prepare,
 	.open		= generic_file_open,
 	/* .release	= nilfs_release_file, */
 	.fsync		= nilfs_sync_file,
diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index 2056cf08ac1e..21d797ccccd0 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -2800,7 +2800,7 @@ const struct inode_operations ocfs2_special_file_iops = {
  */
 const struct file_operations ocfs2_fops = {
 	.llseek		= ocfs2_file_llseek,
-	.mmap		= ocfs2_mmap,
+	.mmap_prepare	= ocfs2_mmap_prepare,
 	.fsync		= ocfs2_sync_file,
 	.release	= ocfs2_file_release,
 	.open		= ocfs2_file_open,
@@ -2850,7 +2850,7 @@ const struct file_operations ocfs2_dops = {
  */
 const struct file_operations ocfs2_fops_no_plocks = {
 	.llseek		= ocfs2_file_llseek,
-	.mmap		= ocfs2_mmap,
+	.mmap_prepare	= ocfs2_mmap_prepare,
 	.fsync		= ocfs2_sync_file,
 	.release	= ocfs2_file_release,
 	.open		= ocfs2_file_open,
diff --git a/fs/ocfs2/mmap.c b/fs/ocfs2/mmap.c
index 6a314e9f2b49..50e2faf64c19 100644
--- a/fs/ocfs2/mmap.c
+++ b/fs/ocfs2/mmap.c
@@ -159,8 +159,9 @@ static const struct vm_operations_struct ocfs2_file_vm_ops = {
 	.page_mkwrite	= ocfs2_page_mkwrite,
 };
 
-int ocfs2_mmap(struct file *file, struct vm_area_struct *vma)
+int ocfs2_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *file = desc->file;
 	int ret = 0, lock_level = 0;
 
 	ret = ocfs2_inode_lock_atime(file_inode(file),
@@ -171,7 +172,7 @@ int ocfs2_mmap(struct file *file, struct vm_area_struct *vma)
 	}
 	ocfs2_inode_unlock(file_inode(file), lock_level);
 out:
-	vma->vm_ops = &ocfs2_file_vm_ops;
+	desc->vm_ops = &ocfs2_file_vm_ops;
 	return 0;
 }
 
diff --git a/fs/ocfs2/mmap.h b/fs/ocfs2/mmap.h
index 1051507cc684..d21c30de6b8c 100644
--- a/fs/ocfs2/mmap.h
+++ b/fs/ocfs2/mmap.h
@@ -2,6 +2,6 @@
 #ifndef OCFS2_MMAP_H
 #define OCFS2_MMAP_H
 
-int ocfs2_mmap(struct file *file, struct vm_area_struct *vma);
+int ocfs2_mmap_prepare(struct vm_area_desc *desc);
 
 #endif  /* OCFS2_MMAP_H */
diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index 90c49c0de243..919f99b16834 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -398,8 +398,9 @@ static const struct vm_operations_struct orangefs_file_vm_ops = {
 /*
  * Memory map a region of a file.
  */
-static int orangefs_file_mmap(struct file *file, struct vm_area_struct *vma)
+static int orangefs_file_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *file = desc->file;
 	int ret;
 
 	ret = orangefs_revalidate_mapping(file_inode(file));
@@ -410,10 +411,11 @@ static int orangefs_file_mmap(struct file *file, struct vm_area_struct *vma)
 		     "orangefs_file_mmap: called on %pD\n", file);
 
 	/* set the sequential readahead hint */
-	vm_flags_mod(vma, VM_SEQ_READ, VM_RAND_READ);
+	desc->vm_flags |= VM_SEQ_READ;
+	desc->vm_flags &= ~VM_RAND_READ;
 
 	file_accessed(file);
-	vma->vm_ops = &orangefs_file_vm_ops;
+	desc->vm_ops = &orangefs_file_vm_ops;
 	return 0;
 }
 
@@ -574,7 +576,7 @@ const struct file_operations orangefs_file_operations = {
 	.read_iter	= orangefs_file_read_iter,
 	.write_iter	= orangefs_file_write_iter,
 	.lock		= orangefs_lock,
-	.mmap		= orangefs_file_mmap,
+	.mmap_prepare	= orangefs_file_mmap_prepare,
 	.open		= generic_file_open,
 	.splice_read    = orangefs_file_splice_read,
 	.splice_write   = iter_file_splice_write,
diff --git a/fs/ramfs/file-nommu.c b/fs/ramfs/file-nommu.c
index 7a6d980e614d..77b8ca2757e0 100644
--- a/fs/ramfs/file-nommu.c
+++ b/fs/ramfs/file-nommu.c
@@ -28,7 +28,7 @@ static unsigned long ramfs_nommu_get_unmapped_area(struct file *file,
 						   unsigned long len,
 						   unsigned long pgoff,
 						   unsigned long flags);
-static int ramfs_nommu_mmap(struct file *file, struct vm_area_struct *vma);
+static int ramfs_nommu_mmap_prepare(struct vm_area_desc *desc);
 
 static unsigned ramfs_mmap_capabilities(struct file *file)
 {
@@ -38,7 +38,7 @@ static unsigned ramfs_mmap_capabilities(struct file *file)
 
 const struct file_operations ramfs_file_operations = {
 	.mmap_capabilities	= ramfs_mmap_capabilities,
-	.mmap			= ramfs_nommu_mmap,
+	.mmap_prepare		= ramfs_nommu_mmap_prepare,
 	.get_unmapped_area	= ramfs_nommu_get_unmapped_area,
 	.read_iter		= generic_file_read_iter,
 	.write_iter		= generic_file_write_iter,
@@ -262,12 +262,12 @@ static unsigned long ramfs_nommu_get_unmapped_area(struct file *file,
 /*
  * set up a mapping for shared memory segments
  */
-static int ramfs_nommu_mmap(struct file *file, struct vm_area_struct *vma)
+static int ramfs_nommu_mmap_prepare(struct vm_area_desc *desc)
 {
-	if (!is_nommu_shared_mapping(vma->vm_flags))
+	if (!is_nommu_shared_mapping(desc->vm_flags))
 		return -ENOSYS;
 
-	file_accessed(file);
-	vma->vm_ops = &generic_file_vm_ops;
+	file_accessed(desc->file);
+	desc->vm_ops = &generic_file_vm_ops;
 	return 0;
 }
diff --git a/fs/romfs/mmap-nommu.c b/fs/romfs/mmap-nommu.c
index 4520ca413867..4b77c6dc4418 100644
--- a/fs/romfs/mmap-nommu.c
+++ b/fs/romfs/mmap-nommu.c
@@ -61,9 +61,9 @@ static unsigned long romfs_get_unmapped_area(struct file *file,
  * permit a R/O mapping to be made directly through onto an MTD device if
  * possible
  */
-static int romfs_mmap(struct file *file, struct vm_area_struct *vma)
+static int romfs_mmap_prepare(struct vm_area_desc *desc)
 {
-	return is_nommu_shared_mapping(vma->vm_flags) ? 0 : -ENOSYS;
+	return is_nommu_shared_mapping(desc->vm_flags) ? 0 : -ENOSYS;
 }
 
 static unsigned romfs_mmap_capabilities(struct file *file)
@@ -79,7 +79,7 @@ const struct file_operations romfs_ro_fops = {
 	.llseek			= generic_file_llseek,
 	.read_iter		= generic_file_read_iter,
 	.splice_read		= filemap_splice_read,
-	.mmap			= romfs_mmap,
+	.mmap_prepare		= romfs_mmap_prepare,
 	.get_unmapped_area	= romfs_get_unmapped_area,
 	.mmap_capabilities	= romfs_mmap_capabilities,
 };
diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 42e2c0065bb3..c1848163b378 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -312,8 +312,10 @@ static const struct vm_operations_struct zonefs_file_vm_ops = {
 	.page_mkwrite	= zonefs_filemap_page_mkwrite,
 };
 
-static int zonefs_file_mmap(struct file *file, struct vm_area_struct *vma)
+static int zonefs_file_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *file = desc->file;
+
 	/*
 	 * Conventional zones accept random writes, so their files can support
 	 * shared writable mappings. For sequential zone files, only read
@@ -321,11 +323,11 @@ static int zonefs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	 * ordering between msync() and page cache writeback.
 	 */
 	if (zonefs_inode_is_seq(file_inode(file)) &&
-	    (vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
+	    (desc->vm_flags & VM_SHARED) && (desc->vm_flags & VM_MAYWRITE))
 		return -EINVAL;
 
 	file_accessed(file);
-	vma->vm_ops = &zonefs_file_vm_ops;
+	desc->vm_ops = &zonefs_file_vm_ops;
 
 	return 0;
 }
@@ -850,7 +852,7 @@ const struct file_operations zonefs_file_operations = {
 	.open		= zonefs_file_open,
 	.release	= zonefs_file_release,
 	.fsync		= zonefs_file_fsync,
-	.mmap		= zonefs_file_mmap,
+	.mmap_prepare	= zonefs_file_mmap_prepare,
 	.llseek		= zonefs_file_llseek,
 	.read_iter	= zonefs_file_read_iter,
 	.write_iter	= zonefs_file_write_iter,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
