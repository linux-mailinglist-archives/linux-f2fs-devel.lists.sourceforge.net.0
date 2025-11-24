Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8CC80A0D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 14:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:References:Message-ID:
	In-Reply-To:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS9ZMw2aXc9VrZE//wOFHNxPMWKHjGzPlT8CDFkHdZ4=; b=Fyt/gbj03vizK+xDiyKbYrd5S1
	ZD+xkJAKv1VDZ0bKLteO2FjK95DpiQ2BuO4WfE5SlUfDQKGU7KnlwAIRBGvJFEg6vSWGYmLQLKP6i
	lkM8FwhjTPJ3U5qwEfIjrBVf8lfaCAgUjWWMpyNONdcQC6Ft8S20oSOTgB2Smg7JYOdw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNWBY-0006iF-De;
	Mon, 24 Nov 2025 13:00:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <martin.petersen@oracle.com>) id 1vNWBQ-0006hw-RX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 13:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Date:References:
 Message-ID:In-Reply-To:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JBjBjXCXcCe7Vlhnud+Bhs63Vre3VGo0FIKLAZ6H0RQ=; b=Ei7l5v5WESJAzFr29ToPJQ4/ms
 04IVek1XIFhITx8JCoUhSnirKekEBvXlXrQ0EOvXMhMDmmEhYhxEkHBRxvFMRz0B0awc3Lj8TfooL
 UDjXbFEsNjEgUwlaEGPerUIXq38dhMAkDyEZPQphHDdvoIJWt3UgOgRZQ8gogkdleOgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Date:References:Message-ID:In-Reply-To:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JBjBjXCXcCe7Vlhnud+Bhs63Vre3VGo0FIKLAZ6H0RQ=; b=kzDSTfJd2LQoBzIYqMhm7zhtob
 aqi7J9Yh5va85q6nr+CQGqU/BtN9Vy4DS0SIV/SC3LMjl7iRcO96b6Q0rRGjZxCZj8M+sSUn2Fxts
 0IlT77XqpqDlSxiXjTN5Jh9UxjjDHVcj3YcQJGKDm6gMDrlNmM8kyuIPcCZaq/Hh7BAs=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNWBR-0006RD-3M for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 13:00:45 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOCVFLT1085489; Mon, 24 Nov 2025 13:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=JBjBjXCXcCe7Vlhnud
 +Bhs63Vre3VGo0FIKLAZ6H0RQ=; b=UXkql6KtmsPGldnNfv4SyClHvJABlAvhL3
 Zh4MCkqDSIZY2xG3Z6THnIndLI1LhiG3P9HyBIoYbe9223zgDLUpCcntLjYbEWr3
 TyMBybGAa8C4EaxJeAqomUJ1pWXmOy/LtCUXIKvbx2lvnOSdML9M7qiyVQlzCYE+
 uj/EG8hE3yhKDahDZrzrhkAZD8GU2prBuHenNupmB+dgcLltlQ4EnnB3QxM65Rpq
 bHlQjxC1INDIyJhVx+Ab5xnONOm6SAAduGlXILLggkjEZ26+o20jx2j9Qm8N6j9d
 KbImYsxD81P2MewDF6+W/UY8a6qpVX/3P6XR7KmWbFM38IXHG/iw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ak811hxs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Nov 2025 13:00:09 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5AOC0BWB032016; Mon, 24 Nov 2025 13:00:07 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012014.outbound.protection.outlook.com [52.101.53.14])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4ak3m83109-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Nov 2025 13:00:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeWl9P2HiV8OjF13X/7nJbEsf84iU+GletxASiWEAxN/A3iM649h/AaszYC6K4iy6soONkmKqXf4dL05ALqGdR8CAIao/cHb6FPe8yc8xgSh7KIkh3jMyFVARwmEVVyFbPem0XWloNS2+kxDpQisl03OgkqUtKIazPnmD1zQwP6AyHeAzTbzshr0+D4AVLzpXvknb8F0T/Ljhq2xvu/o7GIUf2B2zTmJ4RS+REeuzF+KpkEyk62CiAOrMnILsOQlPytzowpmxakeDDLP9yUP1UxdDSUb44JFy8pkCWt4Om8EWUSxbS4mDJRwuKD37yyNmm6izFtVL8wP45x1oEiA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBjBjXCXcCe7Vlhnud+Bhs63Vre3VGo0FIKLAZ6H0RQ=;
 b=l0YHB+roc2Gh5MtAl6Z7GBfyowf4gMKcInc/KEV7qHgjVDwXVsku9OpHcbREr3vCo8cuV1I9GelUmwNPg/q300oi4o9WDUeorVVFearfKSe3CKZvRbNeKsIDEBGV/gXsQNQXCuJ3nHQKnrilxzA2bGEjcP7+FZM8KlWGKLO3x/rlHsTx5ec4rlfKKmPaWoqFEcDP/tl7BodT5LoSWBfUV+GvMkmenDFUl4eay92vjr4RRjKJkZ8JcmVL4H8S8fmjX51Ny26z4H0qSl+2AtVPacenCYhljMK2NP+0bOM+OUxVUfLGfKewa+kU2b/eGHq4wrBP8ROlV+62ShNW6NvSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBjBjXCXcCe7Vlhnud+Bhs63Vre3VGo0FIKLAZ6H0RQ=;
 b=rVxk0ZZ4WC14HXgsEa08Jv+fSNo7sfbIKS1qyII+6nGVQ1haCFiHqHUPWIU/h7zwNNonJnOJAb4RWR/ZP86as1DNdWFz8BdK8IX8qakAx/y6wzwvXWD3XoT+x4GSpbZPubf9U4K5yyBzxCtL5F9IItClV+82ZVVbQB1J8aqv2iM=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CO6PR10MB5790.namprd10.prod.outlook.com (2603:10b6:303:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 13:00:01 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 12:59:59 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251124025737.203571-3-ckulkarnilinux@gmail.com> (Chaitanya
 Kulkarni's message of "Sun, 23 Nov 2025 18:57:34 -0800")
Organization: Oracle Corporation
Message-ID: <yq1ldjv4mdl.fsf@ca-mkp.ca.oracle.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-3-ckulkarnilinux@gmail.com>
Date: Mon, 24 Nov 2025 07:59:58 -0500
X-ClientProxiedBy: YQBPR0101CA0317.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::11) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CO6PR10MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 138ba7d7-0671-498f-5b83-08de2b596017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mAv6TPJla8B4dUiIja1PoZ2vAboJc+XZy4YN+XbERpmXG+ik002wvmAQSyMT?=
 =?us-ascii?Q?iLjtfKzp67sz3rntCMJwBHRadYxr1y/Bqb/RstRVsDvR27d2SLFO9xyrkFxF?=
 =?us-ascii?Q?RHHgxMic4YLqXjIQu9cZmdxu9wE4vi2lMMv4g/gJOrxmHtXBlXV7FoM09k9b?=
 =?us-ascii?Q?XfqqU/1PCGgkulvhD5JuUalCn2iAXurFBiqo/xmHsVS3HAbziMATf84s31KL?=
 =?us-ascii?Q?o7GL3XX7dbCpispCFTXX+hSINHnZk3AHDtlH3rxoPUw62G905horFtlmHfzR?=
 =?us-ascii?Q?I6WIhC+/+JLXhh/Drq2ZanzyMrkAMStXcb3DAmsFMtzjQ+oIdCMEuBp3Nf0g?=
 =?us-ascii?Q?D6QvNJfxqkBYqQysROOOzkzaI/Lh2tXswLbOdFxpJyO5k3oqc5NdNAVxwXGc?=
 =?us-ascii?Q?zBpkk45CkWLQLi0jRe+RJ4yvQn/qhr6FmiVuN/flvOtHI03zznvDoS+nBO5P?=
 =?us-ascii?Q?mLwnjqqByzaEVzR3h5Qx06xOqLNVXP+7i/ZZ5fvYNNho//aeVYK2eIF+Lgou?=
 =?us-ascii?Q?mnwGzYQHSp5gQbmX+9i6gLimF5TWtJbvKE1jeB2DI3RLDVxHjeYC2GaSgZr4?=
 =?us-ascii?Q?eSDfiveRaSAk/Q81H9xMXy7ChsRT5r+ey0hGSG9m2CCeYqoAu2J6V+s58DhW?=
 =?us-ascii?Q?jbYM6GbMYETAMC6fVir7InvWsKwVs8AzUiG9WfjTKJzvVJ3l4mqTjKzheGHw?=
 =?us-ascii?Q?6lLVBLWAZgmDGA0ejX4nDaw7gJv0xhpgZBb+rQRjLZYg1AHd/iPE+rzWe1pR?=
 =?us-ascii?Q?3yXeRPeatYzyEAo6PU8KlVuAw1ec9v65eUYHT1gTTnmWFSkscxCSt7IvJzzZ?=
 =?us-ascii?Q?ZlutHQPA3BCoB/3pPmM0FPlH9XqMwwXzY3hcVq011bb8ZwFvcOD/Wsg0RIOu?=
 =?us-ascii?Q?j8TAuYFWgyTOnAwBrkyHeNwxAAD3OEL8UUM0gTD/k2Grgy8u7e1/xJ4mEFPH?=
 =?us-ascii?Q?KCjXuu1v1pjXdNGphC8hoVbYoO2R2lgwG6G2POhzq28QMCAuRy1pmr3iiKcy?=
 =?us-ascii?Q?0aPOffTVbgkVydrKXuBVA/rC9/wrsMphqZ94IVz5HKmrgnEYK1eyUCrx9zgS?=
 =?us-ascii?Q?AWsseLmvfWByJZc4/QzBHozAwtUPbBeqx6oYL+g7tnro/0Q/VKQYGdRK5GtX?=
 =?us-ascii?Q?x3JdRu+gt0vDGovdr+4InZpv2J8hG0903dkItzcU4/haHFSxiqgaH3tNcZWX?=
 =?us-ascii?Q?kWCCAtYAm62Ehq2yjw8pIZ+pOlPxYHx0FjH3tHC4fWJVl87K9Tktfy6U23iu?=
 =?us-ascii?Q?kOtz/KR4+89dVHnQ5NbAicH7bWiRJrYo166gJVpTNzw25RzeyveRhf/fWJcS?=
 =?us-ascii?Q?Kxe8Y4JRNURnd7lWCqomKpAEpoieGslY06TNC8DS1nORsGHMRxjFxuFbMBuF?=
 =?us-ascii?Q?oZPvRIRKoMXfoX8CPvWceNjzayriCcZmvQ9Eq2CIt9et0ywhDSY/gKuvh0Ii?=
 =?us-ascii?Q?fHYjoqKW+imlLWDv4aA09kgGngsFalQd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5338.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OYyE7eSlS9w3SrlkHLpU71YN7Xy9Tsywnd8SgqeIXwumqWN+L+hVbgKxhHBp?=
 =?us-ascii?Q?KcE0G2R1R2p8BdAyB1twzo/nIMujudk3Zgkax3mPUm1svNkqULSKmGgPQ0Xg?=
 =?us-ascii?Q?zhDwBINdXbPrvQF8TjAHK9TROzscqjjuW6LsqNgSjPRSVjRI0rDs26hKSHjk?=
 =?us-ascii?Q?Q28kAzgoBYF3oIlmWMaRhAuPa1Gv1oD5EJN+rj2YxfngrDSERuEW/eHdoxQx?=
 =?us-ascii?Q?wJ3fKFf7EcJXqMKLO6zpqA7Sb6wrOfXcLkw9PzEDM2FpED0OqODBNyC5yRAv?=
 =?us-ascii?Q?CPdBIo64HfTWLduS5jZLHHJUFK60M6jnpKEgN5O+krjgx5oRXK0ftrWH4nJC?=
 =?us-ascii?Q?ysYn6G+9viD/hHrSLgPAOGs1tWW6DWgB3bmEhUKx6/pp7KlV/7P3RV6dSVXU?=
 =?us-ascii?Q?9xPbzOgx4clgzgbixFMYU7R814HTAgumOJT2N5nF8Fgu3Bq6pbPskJErVj37?=
 =?us-ascii?Q?AnSvsLI9nzpT7J4Zeh2W3Uw79YxmrDUwkDR73N2GRZrLTrGpVzFTum9Ye2Qu?=
 =?us-ascii?Q?3WlAQ/GPBs7vLPIA4sZtb/fd3FyJIfb2Ev6tf+hyeFOadf+8B3ei5PIyskUf?=
 =?us-ascii?Q?eLQOfAJdtdxIG9wRy4rkQPOXLEkBHU7A+me3sES88G4hBR+DkZIxhOtt2Kl1?=
 =?us-ascii?Q?OmABMJvklYebjinPJp0BjtyPq/044ngPBqu6UHIf12vEdhzc4OsZ+FgYSzeQ?=
 =?us-ascii?Q?iceGg8b3E+E3/Nxthak/hHpjQH7nzgIRZXfkRYieKYrtpLDNgw3wzNPtRXby?=
 =?us-ascii?Q?UodEoFXbb3qGv6irLBMUjp27FTDeQ0G+GVISySR3W1yvTYBzHBQm/DMPixnv?=
 =?us-ascii?Q?oejdMqbgP7CPdE870mEE+y29hZMJjQwmEj/2wTOdGLEd9vI6KI8I6GN3RpIj?=
 =?us-ascii?Q?ufzhxwHEE4mCmGGTgCWSxkvmuMjdphF6O5f5qo6rl55+AcxqpvBnI1PyxEOq?=
 =?us-ascii?Q?Ql61vWMimkNlEVsGgp9kCW13IfxfIMip4as+ogp7v62Fp39FdZDce/tO7Dlm?=
 =?us-ascii?Q?aUAkIpS23VvwDaT7P72HA7E5IEFpjQx+GblKzaz+70luwb8RuauwBsOdb9/t?=
 =?us-ascii?Q?OUjwrJXlgBAU76Fd2kST320CtQnEEtRjgpvF/+2gwjsw8U34qUlCPF6bK6tO?=
 =?us-ascii?Q?6wvHiuL0jATy23U5ZJQEgtQx6hSZFZcLUw1t/5Ckdc6VUvUg4guRc9WMPfRk?=
 =?us-ascii?Q?OsFHZMDm4Exw3VwpuN2yHDru+f/FobYZXXV2O+gvBuw/g2jOcvjQB4lipI7c?=
 =?us-ascii?Q?bcgLrGh1anN30yZ3KbLvDwRh1DRqZBaS+v61FbI+Uk55vWQgfEqHOi0gYZho?=
 =?us-ascii?Q?fLNH6kOydHMzrcZYycYEwX4nEpVih/G19XrJ6vK7trksBFtK3G7J7lVJEOKG?=
 =?us-ascii?Q?ayGJh86zPqtqYroS6cuu2C4GA5spLhu7Ok55Z33E4D/dq9CXWfup4J2ysWSx?=
 =?us-ascii?Q?Tx3bPqBeXvxFf0bxHa8lfKRwIIumqq0vK7ffu8/1iYK4b8jk0PNeJRWIOBMF?=
 =?us-ascii?Q?tsZIdGA3TIQFoCiYW8viEXYR6T4dmVbgXa6I+W80aCOTdOStk82UfHGVWDb0?=
 =?us-ascii?Q?sAvt4qEHWbuLcv/IVH1z6WlkjkGlpBp+blE9n/G9rr7Fi6bvpu5Rq3FVtSmR?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LDouMbVOf60MP26xSYdAzG97TPPbttQf+0jWUsM1fvsdYUwqy25lZjZ0pUCxi6rVqXyajNEMdb7omckZFJ6sVV9JYFaqRU7Frtaw+u9IBHJcKL3j0euyWNPuSpQu44t+OCqZGt1fDqGYJg7FifQgaUiDsk5nD0eK3PCnL7DbReA7lVNYBK2KLLAPvAfo+IEH8oFJO9XXBXpPsU0TODR/SutO8RoKbjv8gGzhW0aE9TVZMuroHRIOIs0cm1HIgvYcNAuz4I5YoepAlYwuiMCPhVfRZzRjTAxJEPRGv8CFSio14l0kimPI02BrYJpzp+kGtLhjpyAhFx93yCdvgZRGD7EH943/55lDXY0rpNXlIbBf/2O4zkBNygHi7i5JmvuiybZJUT37+5KhgKnsx85ArjLfNCc4xNbTGfotgYIelsD0qyAi8PvdnukzQ3ukXBl6k1dzopwixKJLt73lthniYtYUb89b5w+1gLsMxL7P3E1i0qS/FszhIjowXUWYdqhZvmYpxktIExA/pLmAXm47qrO2sMSZhSEbDvjEPBdNXciIRBELe6+R4Zr9AXDcYhOkBQabw0npGHdPabzrOR/8DoV3sBQISKudRbsJsyGp0Mc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138ba7d7-0671-498f-5b83-08de2b596017
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:59:59.8999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7E2w3CY8e9qDnasy0VfvNNtojvW/s5pG29HxCcNb7Lm2qn/BYpu/aFT1fTSiEPEmi5JmPy5aNAfAMw80PqwRNm2vayS/6ebGsMZp31/lz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5790
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511240115
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDExNCBTYWx0ZWRfX50l0lWeRlP9W
 Q0+yYvVY6xQvSbtsDau60rT363DEXlbwMrTexWbqY3AYIyDXrc3TkLgu5a8phj5+HVFrSNJHUuv
 uHmCPtw3t8luALV62uoyjwhTa8I67ojj4qoeImGGZm7JviSdTgKyM9hufK/qtHlN133CmDXZjMK
 OPc1VeRvkbqgx3xOyuqN4r9txSmTPibq3QSaciWwfKtxOGQK1dDkSmB23tdyhjN07EaIjkHHPtv
 piJopaO5fcEhLJ9WaajpajEJR2KRmNdCsYs6jUOlb9lU1NHa4aa+7r1oCK1flSZ3tCSpmytpbop
 0AFBELZt3/xyroonqVX0P1JtA4g+KYK3d7eOgi2uZt9bfQfbehhcq3Rv+x1avigFz6extfbahEu
 uUguZNSkgIXAmXCo/28QbQ67229lhg==
X-Proofpoint-GUID: U4luG0fnAZ3Io3KXPSnVcRCYuPN1UhlW
X-Proofpoint-ORIG-GUID: U4luG0fnAZ3Io3KXPSnVcRCYuPN1UhlW
X-Authority-Analysis: v=2.4 cv=KKpXzVFo c=1 sm=1 tr=0 ts=692456d9 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=pWDT8AUh1qCbmSU3YTgA:9 a=zgiPjhLxNE0A:10
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Chaitanya, > __blkdev_issue_discard() always returns 0,
 making
 all error checking > at call sites dead code. > > For dm-thin change
 issue_discard()
 return type to void, in > passdown_double_checking_shared_statu [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNWBR-0006RD-3M
Subject: Re: [f2fs-dev] [PATCH V2 2/5] dm: ignore discard return value
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
From: "Martin K. Petersen via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, kch@nvidia.com, sagi@grimberg.me,
 linux-xfs@vger.kernel.org, cem@kernel.org, snitzer@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org, song@kernel.org,
 mpatocka@redhat.com, jaegeuk@kernel.org, bpf@vger.kernel.org, yukuai@fnnas.com,
 hch@lst.de, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Chaitanya,

> __blkdev_issue_discard() always returns 0, making all error checking
> at call sites dead code.
>
> For dm-thin change issue_discard() return type to void, in
> passdown_double_checking_shared_status() remove the r assignment from
> return value of the issue_discard(), for end_discard() hardcod value
> of r to 0 that matches only value returned from
> __blkdev_issue_discard().
>
> md part is simplified to only check !discard_bio by ignoring the
> __blkdev_issue_discard() value.

With md and dm split:

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
