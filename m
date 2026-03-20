Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEnvDrEtvWmI7QIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2026 12:21:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3112D971A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2026 12:21:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIqolzKvlEZP22bx0G5XMb8o8CszxSpdKDiSuFatnTw=; b=ZlwGSaxw5GDA3rhx4QK+Pjul6i
	xDwHHlPS942vFj1kolU6o5RztA7YWJaG66v5oOJrFtPEfD3A1nHyjgheQKs6vWrwEfk5WXoG8yx3C
	0hekaeSgrCdVVAS+WYXVDmRaW07L6L258dxA1h4rngUpZUPXN4c5kqVKAhVmot+tbf/M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3Xue-00042q-6s;
	Fri, 20 Mar 2026 11:21:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1w3Xuc-00042j-SQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Mar 2026 11:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYrGOAp6WAoZdu8wML7pk2toj6QWqktnAI2WOUyyBVY=; b=ka9G6PImGu5RkMjoTbd4xF13ha
 LJQNj5z5WcmkFNTKecel65cSyJmVm6pEflpCfyhhUesmR9zjgz2zrzJG8KCBfLrC51paGD2/gadrc
 ey6imYVhps6ha/CqQVYUAMBry7+hIh5vT9xUwQEYnpURMP7N4/i7cva4oI7pCFaVbLVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uYrGOAp6WAoZdu8wML7pk2toj6QWqktnAI2WOUyyBVY=; b=VRvJy/+DbjU7h7+5SHX5MlGKKC
 ISd/AObcVZPQFBX/DVMbA5N4Kb2dYYS27/14RDE2jPlkzefkNLWfGcP5ydklVrZbqgHv7zOt8q4ia
 SCbf/2OYEcJDHltoWn7tKkBKkDEMxe027HEZsYac0WE/minQa2C3XIfbXHMESGzJGAek=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3Xuc-0002sM-DA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Mar 2026 11:21:06 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62K8XosR2498394; Fri, 20 Mar 2026 11:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=uYrGOAp6WAoZdu8wML
 7pk2toj6QWqktnAI2WOUyyBVY=; b=UMBoSu4HZzHt9M/tYyKp+xXOVVfYDbMyw7
 igOsIRc9E/wKXdrvKtWg+uaBVy4UmtTleEAW/vApK7O3DM0hZaZBAlC1v432xwYH
 HQyp5jdSMtICpxbF0pzN0Rd95Y+XTLJUcPNdSzfmRF/Fa9rDA3jtK1CIixREXCSH
 6n4TI2knkZPGywGyvIZyyqsE9fQFpaR9l6nI+gANhxHKdsVxQwWhPQl3isgoL+k4
 bX//CWbnR3iSn9W5zehdC4yLcH+gEr5EMW0b8FV2ggnLr5hh3oZR2qogf+zrlyw0
 LCuw8abqzSTaLBnxudFDKJM+DYNxaotjNhKpWDYCPRxX7KS9lAVg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cw07rhhgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2026 11:20:35 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62KAA371038237; Fri, 20 Mar 2026 11:20:35 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4cvx4e5f4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2026 11:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM+f2NeoPFzLFpsWUZ/pymF16a/v/OubXI7TWVxJm3ZriRzstp64T9qRuXLAW4KUXmfNLUchqordH8NbzLBzKbKUn0HA0xeh7KYz+Lg6Ut1eNkgkgMTLieeUxqsv7PbK+0qoIR0EdOk9h6rob9TbctPNq89W79rcsbT0/K9+iOs6rHypytIQkVQJk8PPKEQwDz6cft7nKSDUAsWwcludlf/r0BXi+AdKQl8Oqr9BMc1MNZ2hpwnPnZYQw2cqEkxE3tAPwljQ0Lol2gc81e2WW0ZiWCvEIawCMJf/yVwuxv5Z/SIicLL8N5xLLiAjFi6uIRjxTJz8joAcgTHUVYO9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYrGOAp6WAoZdu8wML7pk2toj6QWqktnAI2WOUyyBVY=;
 b=Hiu/+U7D1i1ZPKjSIK6tuyQsf0Tdr7CoB6YpASVXJ66VvD/6jbgMyXejcipdjNOmxKLjx+t/Jtd1GWNyUjMk1hFcE/2got1v8VHEDm4vu9tQz/vIcIvUidShxBaKL1fHGlLi6I4y8OnTYf7AHDNEuH4lxyBX5eb98cvchSCnEvbOaToju1GEo15yJSDNmf4yVjqR/a/inR60Jj9NVj1q+zaZ4WUHomqsN8MGCeHY/w8RZW25gbApdEHldrf+oya+paSS7Q4CL9pQf9HHgMpuBxsuVqYCX02Z9UYB2j9Xlx9mF0cbelMpaX3NiSlqE73eG63iMzHD4Fg7GUQoY0ZoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYrGOAp6WAoZdu8wML7pk2toj6QWqktnAI2WOUyyBVY=;
 b=zga4uED5smh7tMxpa3q8r/0xeygFmKAFSNCd7Ia6ZNb96Px59AuDQWpmq2VJhJsBmmlsIjuIFsgbsKQxS2b6TI9BY/t0Q47iovGw6sVzhy+IJcxp8XZave1qdLyw+dtK4j5ikoe5ZaC4MKzWZhjdBDZBDqRtWbKpOCmgXIxSX7E=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS0PR10MB6776.namprd10.prod.outlook.com (2603:10b6:8:13b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 11:20:32 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 11:20:32 +0000
Date: Fri, 20 Mar 2026 20:20:22 +0900
To: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
Message-ID: <ab0tdhzHjhIlzRtH@hyeyoo>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
Content-Disposition: inline
In-Reply-To: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
X-ClientProxiedBy: SEWP216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::15) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS0PR10MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: cec6c65e-1051-4b64-d068-08de8672b2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: qyy0t7p84atCZsevEiIR/QWYeMtTl0Eb1/bHF4047FQsHv6P16N9o1f31ttvituKrgMWzHNhXoy/MroXJe5kWmp3AxygSXKH1RzovSwulj03o2UBsgIFrLBCSonQ0TZ5KM0j/X0uGRlRkHakffnq9dHNuMojaPe66iY8cJ6fX+Z4qKPcToZGgVpPhySQXKa6PqWpaxpfOig2ERBHlWsGLiMybTE1cADzte4IFjpigTQXzbQGgCZIrE9epmVqTWpdUUEvDBLxlTUjTLdU3HQM5fJzRcF+wpH3MU+zfB+SEAiNx76rqONnuIknJca093dTWWgdQ/2WUBzO5iv1CW+gYZDbRVM8x2HRF3jME+u/8a7OTkavE8+UEHsClj3KjCSega+kJyDtg1k+Wf4sd0Buwk7llvBbfvkQAoMa5GH026i5OaSnNruCRuz+XxneRicZvo7DA9qGDbsSACA9RHf5WehuUnI/YiJCVJi1upf0XZLdA4kzj43sDAHxKVr/2A3g5wSmK4UD0vGmPJSiX21HaphkT2rqX5g63l+3hcpeo+a1h43jDvV/afTn3/0benrrlB824rwgkCLi/H62kB9Yo9z7kDiOjuTPJm61jcP/W6FEDM5K4JKven0/WZXBQKlV6KACxfjVx/wp9xyNjNS/TW4i3qeS/zz4FD4MNc/4uOrKKv/tw7YMYG9oLN0I9HnKHpDLTfx1FUvGHpZqbYHQuKqbaAHfPwU5uDsDKEz54Ro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WiCYJIg+A70CGF0vwHSJ21T6V2irIh8Uf3UPhB2x/kM8e8imPID+IyrYdWkP?=
 =?us-ascii?Q?2irmGr9IP2sF38/AAVnKRje2+/fZM80cmR9r8cPPmQPaefVjUC5aTbpVi6oM?=
 =?us-ascii?Q?hXAF4m0fRvVCVM5veaiZ/ob4ylplH9OkyTYfw40EK9KqxpfAdZy6ClaBLiZ1?=
 =?us-ascii?Q?1+kGZgUoqKFkz7zkrQDUFDCWDl6UtGZ7VKOB4zOLh7SOvsvvhjK5WKSFk505?=
 =?us-ascii?Q?r/EcVh48sGFAAArdfjpkYpVHeZFnHPh4Vh06MftjyfEK9RIRoGbusP4ZaS0e?=
 =?us-ascii?Q?7nTzx5Qwz4NzxW9C9amoTHajbQYQK/iaMVxNUk0eO+aBirL+gA5EYvLDMGJ2?=
 =?us-ascii?Q?xHA3E3/2BsRao7+DVj8U0BaY1yBU+YX5LGOzd+vJjrtNIIX/00bU9wtKfVsj?=
 =?us-ascii?Q?BFIO4FYjcmQiC2yJfK+LkvTrOKP9u6yY4avLJR/Qnhk6Tcd7X/68DxaOySjE?=
 =?us-ascii?Q?MRSQ8ZJ5E7gyGEryJetTpSfYYNf0eIPpqjKJuXN8tZd87+Bj+Yi9gP9WkcVr?=
 =?us-ascii?Q?8bduvS3D6k6C74Lql6u/1Fj2v4dmjNHGOzWgqUusmlT4dfR9XfD7G/qwYVx/?=
 =?us-ascii?Q?hjqT8pUavSY9M7J5V34PycOycgzYOrDA4EcFkuK/IdiyGJPmjUi2PQTLKgR1?=
 =?us-ascii?Q?SBgu1I6qiKMjyJynVBgTDtmRyOXxl+zkRml5mocsO8DkR8xPvAZHqEomjy8K?=
 =?us-ascii?Q?YHqldKUXpacO6S7+gVsUk40fcgMxZB0VJ1imbznGTnM8v0HHI3WBoSrfbeMO?=
 =?us-ascii?Q?unEdtqjRKazT7R3skqC9BU1CoMkCrbuPYkNT9LIkWi7L5Xi/CLtHihsuBBKY?=
 =?us-ascii?Q?TzdHIim03w8C9eLkxDacxyfxAUpUfuXXQw1KFvPS4FwT05yttBbBDYyJArnD?=
 =?us-ascii?Q?yOs5fFm6zI8yiscy9+jRDSFMDv0DgOhyMeUW/u2eKAanOGkbRkCJ396kxC4g?=
 =?us-ascii?Q?YjYofasFpXQLj2nZZwR0ZjRVXR2qoU4pAm6xUlQ91/6nIbB3tgNjmqYswJwT?=
 =?us-ascii?Q?9SxgqnPL8c/Ufcxdv1KRRYzH5xfw85dM2SHeWoCpCdsK7w/eispwvBDbABBY?=
 =?us-ascii?Q?akyI5zOcV1UXnjIggXFE5y3iBC07UjnNk3kmpBsW64BpHgqiJCyBdpIQByKL?=
 =?us-ascii?Q?U0j1BG6lPK2FttBYoGo3yuPP3OrLz+1MyGWURTnwR8Dzm41DY5Is1bV6rakO?=
 =?us-ascii?Q?NYlGASKhRrxS8NMVrU4MvX//NXFiaCViQv02sOYu5MqMaW9y1Gy8aITX8SVa?=
 =?us-ascii?Q?3u0a9I2O0I/nxVyKu59tyYSLFIQ4OtRYL3Ja9YzNGkRo4HzG0bXz65MVxDOv?=
 =?us-ascii?Q?xZTbXIRc5yi9uMREhmi2ccwrzdrx47Pyv22W2Llms9mkZknnqi48vpXaHKmd?=
 =?us-ascii?Q?8FF9GJuwI6is/g5AAoKV8wV8er8vLJC0jfbVzlLucNL0xLJY5OOwtWsUeBId?=
 =?us-ascii?Q?t5ZU9Wg66cc/AMNNeobTq7murDMz5VfLlHrYIR5hL68Fbuszzdld2DY6ZtSu?=
 =?us-ascii?Q?Y1fB5MvqzFg8AYLaZRD2sCpXYG/yPna4vFhGlNjRU3qpilL3rYtVAxdqJ67x?=
 =?us-ascii?Q?oOBaiND/K9yeFIWEH/Cj8sqWca8EsSUlsfeRtQqD9jLM3SrCMnAgIQhY+FTf?=
 =?us-ascii?Q?zeNZ2sQTwlwUsVyYXmgbPnNa+tHRzyt+AEoxNs7NFgEd+U8p1xOPfklKlWpC?=
 =?us-ascii?Q?Iy3TcOOLFedy7D/Bc+g+J08UBrMyT3q9ZsyqVna6xVoSprlMfS7c9ahaeoKa?=
 =?us-ascii?Q?Unjb7/+4dg=3D=3D?=
X-Exchange-RoutingPolicyChecked: WY7Mo7cBNDUvqVAWzWu07CKrnvJLypK3LUuOVQD2ysAL6l36PdT1LFuvFocv5ZysZN4nS8zJvqQXjIXcp1YAePFIguXam8qQjpvodw7jWpsgk0Fo/7j924bjQ2rv+4gknn/6DtL4ASEDeYRiS7LyqQgwGyXCDkErQSYc56W9YYxBnZBMEnAvFLEXtwdAI4TFT0Su2z0/rvNfXJ7Hb5T0YFIcpskgQCVd1nFL1/ycO71KYPt6TJKUtgYO9EECcF50jofOuokvUAC0nJmbzKJhX+m3xPAYifE79Ft2ZO+2CJXoXUE9jiN5oL/ZimSYuoJrCVTYYUP3wFNppjBAho6Iww==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fub0NzsSHRIcBiR9lwORSuEEkYuOthyHQV5Uebd7WS/8ca6AguuLC8d1C55NGtFMkIXMzyEpDu4CvavFlRxbQdy/qJhX6rEYCTJE/LWfqSdyVqg14zNsOZsRKYc/qq09NvzgUW60OtWktdn1GI1CXSEJUeAhKWbF4OPD1f1zCaLCq1z7dVbCykzQv7fgtV/d1HN+TZa+FqaNjq+wEiwRvkGt6IRU4SGoAsEvLMt7TcGjzgcT7R/r4gSNTO4zcDHD/E0xZgfkfKi30MyGDvmzMmXtsH77zTrsNDKXcwE4i0O3lGowRa7h5JTYMVh7TerPLC8CRqwPfrwcGlCELcJ0xL6cWD/zPYWNUktuE8Hhl2qCStEzrmOTG2RB2/8JnLcW99r05fUlcLpN5hntF+gwacJOpqn7CSGAQez8Xer46cKRIbeqqu6O9RXskUk4gr1rAgSzQL3AUe9Nu7tTKHbtSz8fnQuEDd07iwpHUlKeHPrAcqOI0DegMjYCf99fmQlhSiaJqbBdzONGsAAjqzEBs6+zeb+uQ0yp6ZF8TQLdLCcVOpDI4+iq6y8HMECKU6HeEnwiUOIuzwgATF0MMSU1VIyzUqEW67wU7DcrNOMeE8U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec6c65e-1051-4b64-d068-08de8672b2f0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 11:20:32.3847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiPQVBG9raLOnfGNewsSYADIVLj4XwI3zFpgN+Jk5bHOmoYLH156PRBSG2m/DbtLuCHPRTJAWu8G/tzEv/ZdfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6776
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603200088
X-Authority-Analysis: v=2.4 cv=HcsZjyE8 c=1 sm=1 tr=0 ts=69bd2d83 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=8i7A3EpTTfZRYE7KBIgA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: nkJd7NMDC9flUqRMr6wljdUkBmYvjoOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA4OCBTYWx0ZWRfX9xjcjiA/Rk2N
 AyXtA+002U0OhBd2sQZp7lOQlFyTPoM2oPC/9gi3+jTuTOBGu21oKlwzupqEeGjg+8+YQvBmAyI
 NcpjgHZuix150Zv6wh6KbG8gVFIJ4w9GJArzTW384z534QXiYdO8Han9UsXM7jvix2WgRt4Bobo
 op6jiZ2L09+aSDC9gHoy9vOCUoubtxxW901/amdHdowD7kSEWxdWLxjW46zDL3L6MLr5HhKSra6
 uZnQ6zZ7MI7uIQnGuhQ66fy4iCu3xpVIChMHp1rwuk/rMKBA9n3ZEyikjMnRHKktclCqQdKlWVv
 h1NmKM6K06Bevds/jLin1GXtCRW0expairtY5noDVC8Pr7PiJCzOwKFfbUZrliMAZu+hVe56AFc
 AZhIm9cbNaX4f1MSsOR7IK7k4S2fcdotreYIE2dITDI0kfrSepsBnSp+2CPo9TE3hhsJokYCk9G
 N2/YfdASFHhHbFq2c1Q==
X-Proofpoint-GUID: nkJd7NMDC9flUqRMr6wljdUkBmYvjoOG
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: diff --git a/mm/kmemleak.c b/mm/kmemleak.c index
 d79acf5c5100..b401954f72a4
 100644 --- a/mm/kmemleak.c +++ b/mm/kmemleak.c @@ -107, 7 +107, 7 @@ * Kmemleak
 configuration and common defines. */ #define M [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w3Xuc-0002sM-DA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:replyto,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
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
X-Rspamd-Queue-Id: 3B3112D971A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
diff --git a/mm/slab_common.c b/mm/slab_common.c
index d5a70a831a2a..73f4668d870d 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1954,8 +1954,14 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 	if (!head)
 		might_sleep();

-	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr))
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr)) {
+		/*
+		 * The object is now queued for deferred freeing via an RCU
+		 * sheaf. Tell kmemleak to ignore it.
+		 */
+		kmemleak_ignore(ptr);
 		return;
+	}

 	// Queue the object but don't yet schedule the batch.
 	if (debug_rcu_head_queue(ptr)) {
diff --git a/mm/slub.c b/mm/slub.c
index 20cb4f3b636d..6bdf409d427e 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -7537,6 +7537,7 @@ static void early_kmem_cache_node_alloc(int node)
 	n = kasan_slab_alloc(kmem_cache_node, n, GFP_KERNEL, false);
 	slab->freelist = get_freepointer(kmem_cache_node, n);
 	slab->inuse = 1;
+	kmemleak_alloc(n, sizeof(*n), 1, GFP_NOWAIT);
 	kmem_cache_node->node[node] = n;
 	init_kmem_cache_node(n, NULL);
 	inc_slabs_node(kmem_cache_node, node, slab->objects);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
