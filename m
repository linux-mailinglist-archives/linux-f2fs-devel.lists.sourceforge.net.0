Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CFA9006D4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:40:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFala-00037Z-1h;
	Fri, 07 Jun 2024 14:40:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFalY-00037T-3d
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TfHlmeQLHsrttEuEVxyl38OStl4/ey4ODw3WhaX+bq4=; b=aVcuNGoz6sVYV1Ho/6DobLx8j2
 V9PIbXPtHsxteM6+Kr0kUPbVSarF26xV8hyLtRkOu/iPidL8AMuF/dvnweyk7WuA/t485wp18e23O
 BLinLY/0WeqE5dKxAd+9pesC9Sbr0l3cCQuLhSBJLeGJ0B9/MlfwrSLPhmTLiQr8cZDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TfHlmeQLHsrttEuEVxyl38OStl4/ey4ODw3WhaX+bq4=; b=aAx4v1kEYTa4gir4a62hVPztPa
 cF3iW8FMIE8JvqgdVbsl8wQpiTPd8/8a0P/Wju8ilYBwWlfVgApUOdVRZb6n8O6OKLnYmXkksCHLz
 6JeI+GZyYjanLokCmMhQcoP/jLVNj9v9EO0gZTnnRS6eZQQl13JikbfZUiU4ZEIdvPjA=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFalX-0002xh-Vx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:28 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457CuYBi009377; Fri, 7 Jun 2024 14:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=TfHlmeQLHsrttEuEVxyl38OStl4/ey4ODw3WhaX+bq4=;
 b=CpmO4fc0VZtMe40v5evlf7yhDJ6YfebvXNkHoLL1PAiyndYhHm+iNsobBlusWL3DadOQ
 B14Hf/jrMS/Bxy8sgSDMP9SAF5T+/6oIVyPwckCWM8/V4vmwbWrgGGGFUixYzx7YgwwY
 3fHIB1cqj6bcpCo+qdmUxcQx2RwPHs7SR1fGHrD5brrotiIgc2XMmYaODKaleS7cVhZB
 a+L0Q7Nq6D22v0Rubwl55leDcHsClG/tqwqIs10J+v1r5bgiZ+oH1RlxCepY6srHAboi
 CVqPAyEWO5LrlnecORHeCWTgogCWoNz5o3L2FqhI23vTbOrSFvqHuoLcGXSJPIn+rpSr 1g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbtwdsur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:05 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457DL9r2025127; Fri, 7 Jun 2024 14:40:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrtd2yuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT4A67xSloG6Lo7diNv8AixMSUI10YlFUAnDfJGPXKHl+DLuqT9udDu6Rj7hk4y+KR3lRSn8ethcxRXLjF0aMxFxCDy4Rn3lfpbb2grLZ1NpdUYGlncop9dLF6027CSMXPep2CxqTSufrdP2Ct+rncRUtdKY9qAXdkkNoNeEa6pbAMBkvsaMoDWeFKZCpinWEwnYsWU+rebvb7/cAiLZHnbCxp1atsubOzQJGHKLFh0PTqFBXb7wKd7EATK75vgs8SDO6G0f9NXtYWP1cPsbqEScuwYjcjmF8YVnosuyzYLWlX8MDJtNmb3h376d92DsmYVt8CPsqUl7JHpuPzlgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfHlmeQLHsrttEuEVxyl38OStl4/ey4ODw3WhaX+bq4=;
 b=ZBFrhLtntqcKsaMSI9b2O+oiM7isSeUErD2Y29jRjU+/nQ3HSO3Xl1rAiTJCvUa95tsC9Ll/At1UwDIEYFST/6iu6WZdMqIrPWkP6GT6KePohvdZd+r+vDLbJr8alTzKZjKqLCSH72kC/DolNf83ZxBMuKO6AwAfoXJoa55wQshSOdP6cT1jq5muzXf0Ztpwrx1GYV7Ck2cj8jkFjkOXN9x8oAwMkz5SJ8hdvHWUbQ5M14Jkn6zvd4Dv9aJ7dQW6A72pC3N3YKAKlSORdU58kQzCVHjE2mI3sxhbsBdQ+yXjtasqa7j/2CBMKjhFotLXoua3jKkJj7VQlXOVn/W+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfHlmeQLHsrttEuEVxyl38OStl4/ey4ODw3WhaX+bq4=;
 b=zfYDCuZsgClBrsXya6t1QQj4KYbbe5vCTI4BQlMtPSeZKPlXxs2fF3OODixaB2kH06L0Q5rqOfsS45HB720vPjt6lPXKcO99GfcFKHOdu5QVh7w4I7J+PR7TKxcTTbGnERMh8QrVhTPc07D8I/ovG56SHD5pBgHQmlqLTPrekdQ=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 14:40:00 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:00 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:38:58 +0000
Message-Id: <20240607143919.2622319-2-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: MN2PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:208:120::17) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|BY5PR10MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ca70f1-e8df-4842-dcd1-08dc86ffb56f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s9kDpd289M8JwR64WeKfqriqesE8Mth3mGgNOmXztShyNqUVZkVByB4rahyu?=
 =?us-ascii?Q?lsfXpHDUuYqMK52ses2bxzz9zhg6QlOPpLzl6/YAvx53oYCq1hHlanduRczz?=
 =?us-ascii?Q?EUZX5ag35s4Q+sTXuvVoxm8myuyXc4+QZC64G7/yIP6gXciVRyTNIKDDw9do?=
 =?us-ascii?Q?7Vit0FVxa6yqdDFEDrv4yIDqfDTljlBAVaTgXG48EzQUIALj/v/8lW94dPfr?=
 =?us-ascii?Q?Dh7xQnuJLtJ4O8ragtpFzQL9MsaRIiNqiHsnA+tioWsiP7aXje+ZP1V/yQ5q?=
 =?us-ascii?Q?6mHN7eHiUb0hyZ9meqxSIF7CfzU8STCKYG8/pTlQlT9goEt3Qg4TjsSDvojU?=
 =?us-ascii?Q?OLgGA0pFE79uoNUGDoO+sAHdKQUqLZnq2cWtIR11nakmagfZkbUin1LD7iP6?=
 =?us-ascii?Q?5t/4UhHcxBOKUZjnIzp6YWxQ8jP+4q+BC86QG+sApWFI0TWVDXkzJZGFCVqf?=
 =?us-ascii?Q?4AO6zgLKoQW9YaKInh9ubqMUe4NTnwuA1yILJ2WR7r/kD5ibr1eHZ4ax2qCH?=
 =?us-ascii?Q?2aboBOSWlz1/nZLxjEsWK3NtSROyEof4R+CMBP+hD9T0WotXtftUcek58US/?=
 =?us-ascii?Q?MP5pem+bV1MxQG45zdffwCLxYK/YAOybsVGVuRon6MYGTVjtTBaiLDHSE1i6?=
 =?us-ascii?Q?8Eb9Ev9/h1mJJJCVB+gkpak5S5Ymht3zOfxTC1hqQhcXmW8QZJaGuS+vr0r/?=
 =?us-ascii?Q?g4Dl+xurIpuZPx3/W3Vb8dPMJG0O9XpZGBU1dP93gy2aVXt1/N1CIxGPgDVn?=
 =?us-ascii?Q?+qoONIR/IeW8HVyVam7Y16irCG+pEqisdKjkyA7eHepuQPqFSHXcaFZ1tdxV?=
 =?us-ascii?Q?xF6PAUbK+YjFwsdf6uiXOWOjrb4SvM1NTZGEBbnyEIzK3Vx+1Je4/bINgmaI?=
 =?us-ascii?Q?yyIHowU233UvHlbwQtwCg4WacAtWTgUiozkvdED0J4BMAFmWdqnMnJ0+9e7s?=
 =?us-ascii?Q?FY5KR0gw5TIZGwgrtIGCsuscB+jauIz8Z/b6jj7RkldqbUtc6iVH8cLfXilk?=
 =?us-ascii?Q?zSagw8pDgJhNpXC0UQrHnWSskbjSGyCwfGhjlzIZ0iOfqMRFTakvUyJypHEU?=
 =?us-ascii?Q?HGevUxJWAntJJXDoOt92TcRgslKkjwLyHnse3RciEnsHHF9PkHQmZBVoZwau?=
 =?us-ascii?Q?RYyw4sQa2frj334SBNhkhgn+lb27cNktUPydpkZYf90kDicHx3NIihTu5SK9?=
 =?us-ascii?Q?zVGBbrsqWRsf9KLIePIqwMqpeaqry6PbqrsBQyrt6QCVN4ncjSdUTHmzM8lA?=
 =?us-ascii?Q?8N731UUIY3RvEsym8OXBAVtZLrk1T8ErtHAHCBsrhIwWxyu8teNAccRT2E9R?=
 =?us-ascii?Q?RuxJseTRj7RsLtBzXgNMpjIU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n7glVZ/9KOxXkv0QJOaiF3Eytg1wWpvsCjWAHby3bJGzYpoOwSTmgwm2RCRB?=
 =?us-ascii?Q?/1sYClxYOEqwnDyUSF82FbcT6K+O7NaXvuH2HD5XjJrA1UIZzWfCOafu7bIr?=
 =?us-ascii?Q?+lcgmEP+Gzu3xeidTSUP+NA279uyeOnMfW3UmBDRuB794B1A10g0pFOgNVfA?=
 =?us-ascii?Q?RONuqnde57hKd9EWiFcM+ZUy0ljvhfvQGg/cbJ4lR1FIpEiG61XQ9GozDhGD?=
 =?us-ascii?Q?DtyIs9BIZ6C3bktF3Koqp5Pbj/9/6B0v1+1hHEXP0li2lNtbOfBpoyDPFLw8?=
 =?us-ascii?Q?GGXbBvUXALSE8O9VVMuvTihrqrL04eLVWHRFpD0O+cC0ASYA/CyBPw1AX3AD?=
 =?us-ascii?Q?9VRyjie8KFdmczYf5dTiKJ3goB304py4YcZdzOShfRe9m469b2QQg3HCQt6p?=
 =?us-ascii?Q?vA4GoT28Vgr0B1is54F8EA/av6GKe9z+KvtT4UUw7BWJGl3ceO+jhhWF2MKh?=
 =?us-ascii?Q?u+egLn6mdGInxsNONZEcgrkT8nasuNcvhbxSPTgVBMvtaZPSWoVNodEhtxhM?=
 =?us-ascii?Q?yHpfBs6+npkguMJpf1/9JlLH8FLcgOk2zGnWwH2t5l8o+ASv9oULPqJL2hG6?=
 =?us-ascii?Q?0Rg7VYaqHbu+dn63k6FxyZMpMrWxaDyfQD+61bsFdRc3DNEm6xF5p05M+oXi?=
 =?us-ascii?Q?kzumBt+aoVdX+kT72STXnBnlqhV/YkmXbpEuMM1qL12S7XZPe8XWPSRr/ytb?=
 =?us-ascii?Q?d1WGhDe4o3rFj7V4TqZ6PVbO/xHxWtjmWG1Ej4h7yEam9S1e6kv2chKn42ga?=
 =?us-ascii?Q?fcwA2yA3uUvQnr9w1BMnLhai2tLpDlXOqzUzmY8JByZZzUI3mpEptgGKyysE?=
 =?us-ascii?Q?57UUPJhd6vhK5eR/Feq7KmYqrIc7KBaDeQY0eCk9J+w6Iv07xkVRntLZNVZr?=
 =?us-ascii?Q?G7+WGSzElG5tbWbR7wAmOMevxYnoo04locYPKazQ73tWK/WXd1YeAzm3XKdw?=
 =?us-ascii?Q?PE/uiSYibh1nXnN8qb8c4QcwpKCkOSNN1xlPadEogyovFV/qyTROanuqKG0i?=
 =?us-ascii?Q?dJe4PGqnJ6JU/LVM0oBM5kqUqeypAZ9ozqjUAy4+hVNJW19u+3p9Vfp08bV/?=
 =?us-ascii?Q?/raMRktTs19WGgTZtfaFemf/u482PBNAD0OuiamcNBxZRSZc8Sc6yaIdz+0a?=
 =?us-ascii?Q?vUTxvo8V5gNGhPTRaLQj1uiGUYZ5vwg+CTwJStjH98AUmdo+F++J/ymPYS0a?=
 =?us-ascii?Q?+Oz7P3bSlSXWy5mP/xvTiuH2pBCPou7+D45Oe3QJ+cn5BzrIz0wN0K++umtW?=
 =?us-ascii?Q?QV87w+FE7PrZwlxEc7Ka/1hOzrw3IRaxO3nLuTfdee2Z/uqPrDZ5I98eIEWI?=
 =?us-ascii?Q?W6JLAlcg9EawMcQl9f54bRnDlICJOZ7fMYPqLQVnuRsSq/hXFv/AwUCOdcCC?=
 =?us-ascii?Q?fHQjfpvoYzu31hLtgDUNtASY3fQ0+1r0tYMw5VuXog1Rg8b9wzuSIIz17gqF?=
 =?us-ascii?Q?cwJcUKns/atOmK5pf/dT/gYwEL5aakQxm2YsIw1077creFbgyhFlA2E2QHXh?=
 =?us-ascii?Q?acJwelCOhB9KcSKme30qdRVdH5Ae1c3p9Y06n0hkRy32Gw+dwcKetCCNuU01?=
 =?us-ascii?Q?qvpIm+X1e7K/6Mgpa0GCDRfcMHnMXWssV8Oss+xMIfDoEFLA1I4oVa4A+3k0?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DUiNDhmVKp8fLlhf7zrPDZUsv6s0yJtOIfXea66Qhd3yVC6C8gEhGlyX9BEPzQp0AJwCqTBIVXwpYfd/9+Mm2X7SyN0Q/rhi1wq+tbGsTthyyajJbpAggeW8r8tdLiNoO/T9fJJZc3Hog190O7KtG5RL6D+cMTNjFpq9cO+Rf7F47Do+fGZxKjVxzCXYLDIRKGOJTRK8NdoyVEr/G9k84cPJlU8QgDCFcpoGGL/p/ngzg2mWIrEQuvrfQr9Ry4ZV/Kjd8XafAkv3zUKl/suM2bObDR5DCY9HHdy6iL4pXvn0e8Kado3v9jws6h3uw63OujaiIez9MgXXI8KHRLZTShGNwpxc6nddgIRqULWfUgJrTFnyQ8d/7VhXIeDPob6ktWzpLAti14FR1Bz2Oy9JVTQ6aNTOQlcCqqb04wXLGasRIsZkNjROhnoLqyjv+q39zxxbZCOSiCyna1i1JLnn/A84ffopuItOAGrM0lmZunexlms06J89xNz6l5wW7wT8eqMgqqSUQQez0XjtsdAbY7YtgbCKmiwzbOOuSqbT6cAFOUPn37oUI+FqYip5BRbm2yTNQFuiHQyMHPKhONccCDvwYxVsQ7DwDxHa4tGtbLM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ca70f1-e8df-4842-dcd1-08dc86ffb56f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:00.1204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFq9A0+jPDtUTEwRqGecKa72y4eTA/3287BxOs9ct24gpUD7IeV6N/Q3ZW6qOnZnqTf6uUm0KQ4aSLRLbyaASw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-GUID: 88B7rpwnOIf7yN_DtYK2K-4UBpHbF7iM
X-Proofpoint-ORIG-GUID: 88B7rpwnOIf7yN_DtYK2K-4UBpHbF7iM
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a generic helper for FSes to validate that an atomic
 write
 is appropriately sized (along with the other checks). Signed-off-by: John
 Garry <john.g.garry@oracle.com> --- include/linux/fs.h | 12 ++++++++++++
 1 file changed, 12 insertions(+) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.165.32 listed in sa-trusted.bondedsender.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.220.165.32 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [205.220.165.32 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.165.32 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFalX-0002xh-Vx
Subject: [f2fs-dev] [PATCH v4 01/22] fs: Add
 generic_atomic_write_valid_size()
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

Add a generic helper for FSes to validate that an atomic write is
appropriately sized (along with the other checks).

Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 include/linux/fs.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 069cbab62700..e13d34f8c24e 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3645,4 +3645,16 @@ bool generic_atomic_write_valid(loff_t pos, struct iov_iter *iter)
 	return true;
 }
 
+static inline
+bool generic_atomic_write_valid_size(loff_t pos, struct iov_iter *iter,
+				unsigned int unit_min, unsigned int unit_max)
+{
+	size_t len = iov_iter_count(iter);
+
+	if (len < unit_min || len > unit_max)
+		return false;
+
+	return generic_atomic_write_valid(pos, iter);
+}
+
 #endif /* _LINUX_FS_H */
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
