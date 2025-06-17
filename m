Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A88ADCF4E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 16:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4MAt5fdEUcTohNPOwvdqQ2dcZB2uaEC8EoxMbpT3Gs=; b=lz91OwYb6BmXQT83UL5+TuwA3o
	TCynK0uP9QIO6LZ4hkhl9JWRtumq+K1dyx5mI/YdzH+YY3qwaajWHYA/ChETr02s6henlY7LPW+mD
	D8/k8bE+lmLrowJvYxp9PFueTFY18ILwlEQOkNGwcMLinNCi1wdWamQv7N6/PZJBxRUI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRX8z-00077T-3q;
	Tue, 17 Jun 2025 14:18:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRX8u-000777-Ea;
 Tue, 17 Jun 2025 14:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0KKCAZEUFhbQCsca+avSGS1Y+uYtGTT1Abh5klWQq2A=; b=Ui8zgEkihmPTGySUu8SF68nXE2
 9WAf/hvvwyR3QxiS7A+pqlXH89RThzdForHXd5fTeh/oBHW3wqe5w7Kuae/m0+nyQbrtKV2LbuXSU
 dTOWyIaW7IMNYCWNBB46w/1E4eDs4YsIoQaZG81sHEuUSgf9TTf3JIJ1wR0YscEBIVVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0KKCAZEUFhbQCsca+avSGS1Y+uYtGTT1Abh5klWQq2A=; b=YZeDYH7K1Dj20HI/D6urbhHEAY
 W8nVEcdmxEaS7kA3WMKGpBMjCJ5vQ/itKipyUAfcFT3ceDnYWjCllh5Sg28J7nMxQBfj/PzN96ilp
 yq+H1y+J00wTy1fIHjIVh4mdjaHqmIxd9CcR6upY7TDk9VsK5v0DdYq38l7ysMf3Dqo4=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRX8t-0002PO-Vu; Tue, 17 Jun 2025 14:18:28 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tag9025365;
 Tue, 17 Jun 2025 14:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=0KKCAZEUFhbQCsca+a
 vSGS1Y+uYtGTT1Abh5klWQq2A=; b=SxAv+SEtqUOU0h701EBu4d9UWPJvyrkQYQ
 FQ8d+crsMTyDaO0YeEHtzMjfy/VQyrHjPNp7DpaNB1YZIqJBnkohtA8WIeYRt568
 653QGs/i/lNFyJNPfMwhtpdTDIhcUeOPPVO0Q45GIwa/T+05MM/lZ2lkOZiX8XIK
 Efs2uqOxYN6zTawaR7uEvafQfUO/C+Wj8DW/c7SEmqxCjbvrwIVkKqtgKfqX8leF
 VjX2n/r/OyCCgT5Ry+kb4VLirx0JiWwKqrcYQKKFt5qkUEuxJ8fO0+vJhwPYgxTp
 zCZNwEobqxSmHh645YXMNwxHwMJJGdWwul0hlV+ZaXSie0vXTzxQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r4fkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jun 2025 14:17:29 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55HCfvce031679; Tue, 17 Jun 2025 14:17:28 GMT
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 478yh9205h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jun 2025 14:17:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OANMc17JzxDskYEip3VAZr31cYXNnaFRcdViaMzntv6YdG70v32ah3YOjbV2vn47MaNkJKHF1i6Q9+WCtx2to0eIoB2MZqpnvkBrJIyZPt7cAxsNoitRpJoQZQ7XWqxPSr/NNQF9BlNyumpmSLygqPjTZgWypsQMgBy2WklM3+JNTbbBWDBSsHVB5WRwQd+DElCRPgqKxLO0Z5co9BlhmY0ptZHZJTrO/cwW1q/73STutKTSYQnv9UNowKDsmT4NPMYopQnTpPHCYSshJiGWEYJHDZlqDzNieuhUacIGHzlXkZY1nI6lb1/1aiSUKpEReOiuK+05yYs0UKGe1p8Wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KKCAZEUFhbQCsca+avSGS1Y+uYtGTT1Abh5klWQq2A=;
 b=FluvaqAPeB2OsDxtC2023QeG7diBBOk11IQFzdmfBz0EbkV5FTNWEinZtHa+g+zvUalAzE9+ClEhAo5kqFfznTOkbar04ldiGmTluntjLsdYU+M3f3MPmQauOHzxGObVuZaHHB++d1KC7B6TxTHsxJXbRP+hzfmDGgP11IyahYlLgcQdWFoNNFzGzis57hY1y9KPJnqd/d6e6dbmpITZY8Ea9T5mpB6/uA2IQRxHSppEqm1aDZFBYlCUHgb1YzuQd17N3PkkSxlQXxqw1afRJvjv01uGTONdViEa/6JT4Gn/QtJs2xDsuJYKWfIHDMgW/izF6Ye1hwuC+SXpoJM5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KKCAZEUFhbQCsca+avSGS1Y+uYtGTT1Abh5klWQq2A=;
 b=WcWMH4q5SW1p4rbO3adGeCYWG3DQFJpHpcZsl20aUf5yehkCNMaDk9rXHPbvCMLqiOFiTIJly+Qi6jWtYbNipOUFBR41vRI2AWZRdjGIr+gteJ3ov9QTWB2V8dHjVfyeYESA78jejhuMC7+qcEKm6P3CZC1vFaopWSag8Dy9Tn4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4574.namprd10.prod.outlook.com (2603:10b6:a03:2dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 14:17:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 14:17:23 +0000
Date: Tue, 17 Jun 2025 15:17:20 +0100
To: David Howells <dhowells@redhat.com>
Message-ID: <45cf6357-2614-4aef-8674-f7bc77be2dcf@lucifer.local>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <644216.1750169159@warthog.procyon.org.uk>
Content-Disposition: inline
In-Reply-To: <644216.1750169159@warthog.procyon.org.uk>
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8921db-b5af-45ec-8b3a-08ddada9adbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AaN3sI5uxeiW90s/+6kc8DyyTfZjyoHTiFtYoeOiuatlWRZmQNpkSwgmuU6i?=
 =?us-ascii?Q?9pRVe99iWFoecHLVwU+wsyybt7xDiWKAh6giH9R86WOG1I02Apc0BgT3HMGO?=
 =?us-ascii?Q?P8KTAftNsSPsxdwkieWzPOannzuNwsrEQIMCU4Jd/cKWg3UonDtfMDLl9yaA?=
 =?us-ascii?Q?nEcv0111gfjKdCnTFlij2dWHiRx68z4U0sSoG5tfVGPNuFKzjON1/SVsaBgl?=
 =?us-ascii?Q?EXIjL8RmiXZVLnfWZ7QwQbbWGpgXGxYyBveMohtxjOh9T1iuo2cUUzFQx1Og?=
 =?us-ascii?Q?jb9d56RswZb4YWiMKlFAhNlfKaUXsdSvY7XQlnz3GVpiqki7bbEyjLJSnNj8?=
 =?us-ascii?Q?9wH4NhgCPH9Xxph3e5vEvRxyXPFwazKOGGqeg6ylo+hSxNIw9tmMSEhfCQCj?=
 =?us-ascii?Q?uibSQfEemw93/69CU7C4fhSB/TigMqt0IdxIVOm/B0LHQMsHuWkhHWutpV9U?=
 =?us-ascii?Q?+nLwW28tPyXVnb+wZKyCXLRtRAtcUTkPCUzC4zsXL143xqcoel/du/Isq/nC?=
 =?us-ascii?Q?rIyNOaIJRFe2Y260zwUQ/nMyve6HJF5bbiYzjengUco9R4dTLeGRCV/2m34l?=
 =?us-ascii?Q?QQXbBMNwJYkSg90g6xXCmb1x6+so1wyrQ43J1km22UtM+GwgQyYViaT/Tgei?=
 =?us-ascii?Q?hwq+ZC7H9j132iZaXBSkGSvXmWz6VPBL01/L653ePmpMlfYnKAWHsqJuC97M?=
 =?us-ascii?Q?XKtzxfGSdW68h+bsjFa9+T6wi4N9yM83aUdO8kgxMyIdxNdAkjokQcxrBn8v?=
 =?us-ascii?Q?ctnhC2sg2pBUqic1B6ALGiQTB7RHKq0qUiISU1KGlQS6u3S2ccYuDGUHq1MF?=
 =?us-ascii?Q?eQCOk31xsFT8CoxZOHT5eaERC9BsN5vIE3Wm3oHjO4Omi4N6TAgePFRWAB3k?=
 =?us-ascii?Q?u+CUGUJvbKHjfjnknsTGeI3vFENB918Vp7QvONylH054BlQ/0r2H65ylZF4u?=
 =?us-ascii?Q?wqROFm0zU0WZhMpLhCEieK+iSYgfvAAo4bVwmWs9Cd7toIqelMWvqOJYpMYZ?=
 =?us-ascii?Q?JMV3G7Ct02jzmRGtAGCOC5QoiQ3x7EG22UNcw7/MFn9R8XTlPoPzdzoGwq16?=
 =?us-ascii?Q?NhQ8UzXSd3Bsz3xhDoVT5WCSF7HlqCKrWhgPm4oQAtO9PSQC+G1RDvkQnwXv?=
 =?us-ascii?Q?1MQyBSrD7TuyYoCJIL+60cWgwPmECLjf1UD5eITFsN6S455vy3aRjlNo+X5o?=
 =?us-ascii?Q?gZ6hpg27KTQXuAad20TAh/LrhDBoi+5NExH2JukLLgBgkFLH67eCO4Hv0hJy?=
 =?us-ascii?Q?UZ0N4VdeGw0TPvbpLG7/rRhtTUam+42H6BZBNJJYiqxtm5Ab8SyOg8uZGsBE?=
 =?us-ascii?Q?pyRB0qoI6Yo75lZ7J7yuzWu3LI+hOKksOx4lgA46ijG3NEBAl1ELDsMHsNQT?=
 =?us-ascii?Q?kHDBQvtibnV83Qzoro1p1e13sab4Yee6irPWIsP04dZaK2RXZJcFjQX8XcZc?=
 =?us-ascii?Q?E+mtFlnCSxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YpUIN0eiEHR1IqDPdI0DKV6HVg1NpfHhaBLy/kZtIXMLcCRXv15nBWdu+Gwp?=
 =?us-ascii?Q?cRtSh7k/iCS9I9SdjFeSVKFEURHatRR0VKn3ZVXpyDjcBIh/EXc8KMbHAlb0?=
 =?us-ascii?Q?V0sS3D4Ueum9YZNRNGRj2/Io2OfyPJ7r4aSDIfo4nPG7HvKYaXCd3vw6VQyk?=
 =?us-ascii?Q?6pCvioe63lOYcS3PxIOyfiTkmwxVYk5sK6kbGQS5V2OPPUjYgH6cDl7bvJ7y?=
 =?us-ascii?Q?JkRv6L/o9+h3PP813iyKofG21CBAaYExjg9LDzsPitSJSuyXlhmuIL3XwVly?=
 =?us-ascii?Q?3ctEdXxAYqzLOPzUWsHxwhd/QV/QE9tf2VTRRflvRs21yQK99H19szrDlaxa?=
 =?us-ascii?Q?I76GgOvcCuce3wW2A9sJ3Ot10anl0+ND6o4f+ljakNJjsg3Uy/HTjF+U7x2y?=
 =?us-ascii?Q?IkWLfFh+qjiym4qauv8kGiXMfQtsWpngz134Ih1ZiYoWFG03Aq4R+rSVVXUK?=
 =?us-ascii?Q?FgnTOkmdsbFBmNscDXHuzRC1CXmN2D7wJetxnhV0IoyNpJaG4k0V3GG4dB2W?=
 =?us-ascii?Q?UGzsI+ZuUsBhlbxBrVWN4cNpAFz7JUUpIKaKxuRr1USmKYMb4YudDOAImoxe?=
 =?us-ascii?Q?VigBhobbGzxlj3hG20rSYWWQ/LtbJndGVPOI3OadobC4OZXSU2Zdq02ZmABl?=
 =?us-ascii?Q?zplUw81HCgN4rHEYjc+dNAVpaMWR0knmoTlD0Dwv/iH/3sFGlAa2jG4Yvy1S?=
 =?us-ascii?Q?//Pxijkp5cj35mxOIJf+JqvClrJVtea50Ake55fGeae8ZFdFRFoBqEWtK4X8?=
 =?us-ascii?Q?zApE39VdhCb7aMJgWukN1RtDiBxG35WUWpS1KR57MgPhvDtvjciGej/kVeCo?=
 =?us-ascii?Q?ZSzFtLvBNH8aw/Eavc3BrsRb+1nzrHamDSA44ELYAn4UCkgeOchEV8PkIMaA?=
 =?us-ascii?Q?U+/8y2Yybhma5yRUiEGTI5855TJNq4WwdBr5Xmntq7gQ6/VEt4tcAu8bqZhb?=
 =?us-ascii?Q?6SDOIm++wvP9jDLtv/39TsiYKSFMw8AjMLlkshGGorign+ThnUS4ASa6SXJ3?=
 =?us-ascii?Q?8weTWlo+AK7uW6YNYKyUeP97QPZRqEMD2bdw8EN8sRsoG7YIz/PTHTVWMLkK?=
 =?us-ascii?Q?hjs3EcvUPPrj1buzqRvLXAQsyDkLL8lm+6KXNfPfrrtBe0CuzoFSVlPBb6mt?=
 =?us-ascii?Q?+xEfP3IhHmtVonhrrB/s62DrjWMEhg33Y996Kb5997Za5ZC4gYyCgMkb7nRm?=
 =?us-ascii?Q?L2lIubJ2YHw0xSRlI/6G+rr/RuDvh1PExk00sOLOjQEh2JEvP7QYy9WoLnlJ?=
 =?us-ascii?Q?XoY4DgfJlgPXqiQDQ2lJp6dAs7b4OstEtyAlxGuPQYWZh/oG9LwY38FGA+MQ?=
 =?us-ascii?Q?19c+XsZ7/H1UH1mJM44PAAFjQvrymNMJ6BQwUH5ikrw3PBwOwMWcrpDWFFB6?=
 =?us-ascii?Q?NtgxcsZun6fOqfI04a5CvyKWSs4jTrnC6+P9PdIOtn8W9SRStqv1+g1sqYHa?=
 =?us-ascii?Q?DgLRYsuP24D2nCVEAFEEfCt5EI8HVMQQWp+9yhAiQJ+FD6vd7yEuDSOhCKD7?=
 =?us-ascii?Q?+eF+Y50ljARaIFx0np7JPZBBZgt59BQmlf1BeXe8Pn/UHMqhod3ALmVSy/tI?=
 =?us-ascii?Q?cCsfA/aSUf25iqwT+EhuRTLXWb9vI2ws0jGUWGf+YZNjMHSCdnslJaqS+5JV?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QBDRQjWETd6/m3CejgBVpyVWCnusB/UWF9U+oqpTK0a6F4KCFxkoct90AXRodhXohG8bOQj/+jyKphhEC2VZCnEfH3oK4kIAxzkn6Bm594gW+lz1QZZLec2STuNplAHrM1TUINHIO7ytmyJXPSIEt+AyCp9sH0E6aUuOfSU6H76MP4yxqqVaGJI7ehw/WIkkedq2rHwwCYWSJmY+a6iaaDQqP+Op9Dg1jQ7/cgx4DbVStmtWQuvxi+9vqeM50OBoU1k/jRIdV41snwJjmJy7NrXsiMwvGnqkVCoYYEs1W34c6QZQzDOqPLEW9Twi03TpmC3oE1DuzYJCnaLQ+PyF06fIa190pwDf0uKq2W29Sg1OYZWb91Rx7ihtJHL7Gllt0Hlx26DA/KIzrTudyGtP0bNFs+CcB2jqy5IZw/prKssX7+c9rxD0+lJShbpjUXBZq0UItW5tSbynBdmrLDiUqhDALt/DdgW7XBxd1+eUMlopyLgV5/IXayvJgMstq1vJXd/zEHXfKhBK6goy9UsIFDprmbmnuV2iY6HJGUQGVlsAtdDfyY875GjU+ChgQayNDmkN7LQBzV8Cqhpk2iiaRw7A32VGpq47GoL97BMC1bs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8921db-b5af-45ec-8b3a-08ddada9adbd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:17:23.3401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ghwvxifeqDis2+M9YYGHbNIbWg1bDN1rNvEWD28HL19Otdrs1AkUIn56FThJtEcwstA4sMaqLPy1dbTWtiaCPBMKXivB6TKwcp+87esXSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170111
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExMSBTYWx0ZWRfX5ZzlpAp0kbN6
 98Calk+SvXfzIYj5Ke75yBlRHYwdQ+AIjUAYtTZ4R0kezDKadidgziqPF2wXnUsPPYjHySd565R
 C+buSQ+AKYXwt8ohDlxe8/4ELFryq0AksrRFSdpfHPpYI3rP4I+US8H3a4U1tJTOAA2a68Meap3
 f5w+3w3iC3z2DbrGe9XvoLz7GgD0tGOmTyQJGJgsrxJXSCQAc+j07zFTUbVjCdR+vIPrpO2IdML
 n9eIGpEWnP+Zq0l5U1M8V4li6hAD9IGyGOWHXeo0ZspTqY5YdgLzduad18MSs3GTtBS5BFhyr+O
 3/gEwft2yHIXR4CG9Xeid0pwRtjPfK5cskbCvONL9gCUWxxt7NDgouK6wkVil+GbKTCNIrtAJ2k
 w8oZdeyX3tPa6x89VpzaXq7HForJOGQacvFabDSV0U6J4Ahi8AJlkxu/wDzun0rEsI6cfGh4
X-Proofpoint-GUID: RxntZxdAm8nWHdzoxwobwSyZjUt3_-je
X-Proofpoint-ORIG-GUID: RxntZxdAm8nWHdzoxwobwSyZjUt3_-je
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=685178f9 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=MA-42675piwLz8QlgOoA:9
 a=CjuIK1q_8ugA:10 a=Qzt0FRFQUfIA:10
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 17, 2025 at 03:05:59PM +0100,
 David Howells wrote:
 > Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote: > > > This is preferred
 to the existing f_op->mmap() hook as it does require a > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRX8t-0002PO-Vu
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
 linux-um@lists.infradead.org, Joel Becker <jlbec@evilplan.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
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
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
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

On Tue, Jun 17, 2025 at 03:05:59PM +0100, David Howells wrote:
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > This is preferred to the existing f_op->mmap() hook as it does require a
> > VMA to be established yet,
>
> Did you mean ".. doesn't require a VMA to be established yet, ..."
>
> David
>

Yeah apologies, indeed I did :)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
