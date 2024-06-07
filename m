Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED49006F5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:41:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFamS-0003Ro-Fz;
	Fri, 07 Jun 2024 14:41:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFamQ-0003RP-EV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VgojAUgaAcfjIryjnXFOxTXgxUloGI+kwqZmSnGjXg4=; b=JA4PK2bOOmJoJn7Nt8NbI8OEU5
 0eiu/DSEUFbtzvhx8bdVidTffag4KbODXBkIFg718Sxe5Q0UkE2EmHSPE0e3UfTgW3gkr1TpBIyYC
 kbVoDGEMVpK1Fesy8GxxpSGMZbaF7Xi4nF3FGe7oSwF6YSK8PZGL5O6K4tzhbWRCeX2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VgojAUgaAcfjIryjnXFOxTXgxUloGI+kwqZmSnGjXg4=; b=Xisu9pG6MXY20NDv/92JulBB/f
 CzTRcXbDuX/KYOy9GgHn9P2wW7Dr+I49yEvObaOJ2mu4LdNR1YPn1a4sR0gBPEDS5JDJLR+bwymOS
 sVIH0rxR3plUUOooI7sCpHzw6J7TQtKDw1hIAdC4UkewhiVgkJOZ/FW3XjUQcaMdWpu4=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFamQ-00035C-RG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:41:22 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457CuU2x023572; Fri, 7 Jun 2024 14:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=VgojAUgaAcfjIryjnXFOxTXgxUloGI+kwqZmSnGjXg4=;
 b=j4EwXIkPfMRFsIvzhnqT23jD8QN9BDdvpK9hkPSLbI3spR2H+rA/H+Zv/qFOs0msWQI2
 iaFbpF7IYgC93PBopGZKBvtHqxaVM8sPsCshrh28E5Ctscmeq4Le4EA3h152fwoWqzW0
 JFl0QfxKJM1kmpMzkjaHx+F4gHwVRWLdgkfCoSPCP1rtXsACJHl4E3/bb1c9/wGFxVNj
 IYwk9rZMVv6SfgZRDqCpayx2XZgPFkPM90rbPWix+MldDy4O6JQHVMi4vVjVf2JkulPq
 UFo9hM5k33qx910tH+rPoae5r1U3LLOmINBAWPcQl34cEVjcjQFtBU1EYu3W/w9+x0es RQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbrsdq4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:41:01 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457ECfBx025130; Fri, 7 Jun 2024 14:41:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrtd311e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsL7Yq1WxkDvhlzNkp9t6LAwzCmS6w+WRgD/g8gKXuYsYrheLBut0pohYphUJ/2yXpkAZQ0hiL8FFF6YH69XI+zaNdFMID4QDXQXYagcvLvzSgKVLhV3+JB6hpIH27ug4AnROHXDM7rgR0ZwG0rEy820bjqH0Clj/dS9xEeJHmL1k/o2J3f/ebezfyCSb2VDkUlnuU8LefsXHHSx+5fmvEi323TDhEgjAiJ10HOqnDSi7EtaYTdn1EhjMNjc5cOvnqpyX5EGI65nuCPu3JQRrj8ysSaorm6yLptwhvo1wh5Azga6gp3Pev76xOG0m85Mojmbgp5wzQOqvi3n2Y3n5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgojAUgaAcfjIryjnXFOxTXgxUloGI+kwqZmSnGjXg4=;
 b=cy/eK+su1oedtuu9kYVJrFQK/VFqkztuTl7H1ID//gQqySZk3BBrZEFaENNYQJkiTb3U2KxHYavdqfP1CJGU6UGCKti4i2+x6i34xFYPsqAk+E3ybR6EPU3OoSBUZSw71fqUkrY1UC5qMXhbJ0azcucvU7zGheBAtP7+Rr1E5oTCDHVA7ycPS5DUR3W5pFl/wQ6XV9BEAhJT6CEd4+oOqqn4x9Rrxig8+7DQlA7R4oHo8QdLCFuIyWIDrXQhKiR6bDD0X3W4OMQZYbioF2Ciz3KN6hg1mdq+P6T9LF6uDRSB2j62YKCUxKXzc5Y+qbdJWwYfo5WKW1vtqNsrsaIYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgojAUgaAcfjIryjnXFOxTXgxUloGI+kwqZmSnGjXg4=;
 b=sONOY1MQ4Q5kU5hoJQhQYRotciWlqhcS2VO7zuj9dKf9+lMAuoQ4cUM0Op09F4Vve2MV8GB8qcfiWaawxpeYBlZQahtVvzNRQXEfyVgaUTObrGIwI1wcRLOESOcjQoXojIJ3TkMM544gyA/9+Jnsmd24uH8a0AwA8OIGD+v7HQw=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DS0PR10MB7364.namprd10.prod.outlook.com (2603:10b6:8:fe::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.34; Fri, 7 Jun 2024 14:40:58 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:58 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:39:18 +0000
Message-Id: <20240607143919.2622319-22-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: LO4P123CA0699.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::6) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DS0PR10MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ce0436-dad7-4cdb-571b-08dc86ffd824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rr+5JB539Wwnb5TGBoXvQwyqbnYIH3qU2HKAjUZjIa2dY8QazU/KZxA8wI3U?=
 =?us-ascii?Q?E6KrLiOQbTYgB6X4K23txENbQJmgaHF/S+YYDUdG/3lvJiI5tQM+9B6u+eIC?=
 =?us-ascii?Q?0e0+/+qTZwh3EcX99GSWRccbIQ3JBnBtD/5QQ7f8y8NdalgoO8xQa4iM+1gB?=
 =?us-ascii?Q?y07l6qGWlOipe5dIW2WgwVuPH+rxF/kpWBqCXKLbqlp/pTGGbl/eqjAl8PRI?=
 =?us-ascii?Q?1LPuJgZt+OXcBsoiYV4XjzqQJdSvrPWdtjGI/fw6QfTVch7Zlm89AW+EPhE8?=
 =?us-ascii?Q?NATad10g56Lbbw6ZY0RQZHJqlJw9G9IVQisR/5UGjPzpk6EIj3LMAZlAcos9?=
 =?us-ascii?Q?5m8C+/+LwDGTNCIK1JOjv9t8vqmZN2Sn7z8vS9YEy4oJSJ4D4gXlu2cOjE/y?=
 =?us-ascii?Q?goOTRvmZGfnNjp6WT9MF6Jwy+9G0ZRYy6RS74JaAsZBnZL9yQxW6XI3wtXwh?=
 =?us-ascii?Q?OABtg7BxSPAL0/tbxdphX7ecE+a5/2ft+Pc6YkDe0Y0M09dZL1A9HFMBKD3g?=
 =?us-ascii?Q?Ul5eHRdWrhXYiN5S4nFW0TppDVxLELwQqfobhn7CxmQznu+xeHbmyc0H2OW7?=
 =?us-ascii?Q?VnJaQ0IbjDWyHE9u1bxT+0prKXUw/908KFV9GQRVoc2AQzpJIrOf9PyNqNFU?=
 =?us-ascii?Q?D5q+R7MtZuEs1zOVJOYf/mIK0t3yUvCwdfxlsgcLhr8KMR68R6bkJKnjVSIm?=
 =?us-ascii?Q?SoWv8KrmVJHH6Eg0735RjF/LGN3qEVq2bcM/5dL05qjPPxRVXdbMPjjD6QAy?=
 =?us-ascii?Q?3rFuy2XefU0yLvfFKx2+DGt2/fBZXmJEirZK/zitDzsR5ez9t1FjlClmtQd6?=
 =?us-ascii?Q?Kc6F9f9mnwoqY9pxK67T6rumdXBkINheTCRlMNk6MQb443ngPv6ifwf9kCBQ?=
 =?us-ascii?Q?SU4L5ksZzW/nSkR45+YOCy5WmUX7/d8Fs0n4SCv/F7sGJ7rFnVSjF02LECqb?=
 =?us-ascii?Q?jUAfzU5mDa3ethuUbg5XkQasmLQWiUezDBVS69K1V8Kkh/ni1lR/NFJgYKYS?=
 =?us-ascii?Q?imiQDxuk49EKSRqneKMU7w//z91JyP4MvUCXOkFDceqHAoAVr0a2/zpHNRS5?=
 =?us-ascii?Q?zPkmceeuzk95dBs7cDjQ1vwPdTcQN5M1XKRontqtSj4ttfZSvsK52CW59on6?=
 =?us-ascii?Q?93YaQn6i195YQ4zF5ZJr1+FmSdjMVXQ+4eJA2SO3F4vaYjXK9QRc9sob3ovY?=
 =?us-ascii?Q?7eKkq0noDUYMA/xUrehcxivvpuTblzULeglnjxtrLt8nKYeH20StHIoH6GIs?=
 =?us-ascii?Q?yDyZ5y61Fo8kfPcUa13CmDI1d1VoADo7xv0lEz+4Opog6iqFTg0HNqKEyhf8?=
 =?us-ascii?Q?9YTyWJjqkD2kEp58bqqVhla7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2nD1oK0zgfV4CTSsSxS0aPUXU8Qwe+Apf+g0ccRzanTgJhjSr3hk/T8jw3rr?=
 =?us-ascii?Q?VpUHkEG2u8xGYEazqur1BBtk9rftdRJ9tIMjCGa5+yjRZB+dhXf8k6ol+6Rj?=
 =?us-ascii?Q?LnLvQrpND6f9+a86jOXFgZdxr44tDaYY9cehPkNEm4bYECrayUdqfIrlD8x5?=
 =?us-ascii?Q?wEh58dGVwNM4np7tsbbmMoEMhqH43vZrHiwfW/VCW5Cb8tosxxvvF3KB1sCV?=
 =?us-ascii?Q?YNR3PgTc2dtq3SFqlTGbixKWQDG3RMFI42Kn8h5NmTE4B3KXcsRwtq8p2Yw2?=
 =?us-ascii?Q?EoGRTAZUFNlumaMkW0Xg8C4csz5Rt4p9m6DduXt3KeS2bbvldQiYoWdracf8?=
 =?us-ascii?Q?e7697nEfUonsMO96kl4Uq4JHGXhj6aDQND2XMw4H2hyAdsuVzzIIvL3zlLXE?=
 =?us-ascii?Q?XGVka+mTKep4mWsvNllRxaDo9Bykg0HWfPZHiGrfgq+Xig7tL8u68x0HKA/3?=
 =?us-ascii?Q?fY4p790SQnYdRozeoQ5MTM9d48EJEi5F9VFGXDhE6ytD+pL+rFR9yzOM8qHG?=
 =?us-ascii?Q?YIDrDFlJJ990h/iSAyHkaf0Cfo58DQOPxQ1WAZiFcHTQSf7krJd1ib/DYnQj?=
 =?us-ascii?Q?W+esQlNdLOthTET6w/0mRi2AuKTnX5p8luNDlTpXe61IGo6hm8jY6MLIhufz?=
 =?us-ascii?Q?G7je1Qry0OJJTHOiO+3d5SLyK+QQisXf6Kh4wd4GTeXF9gs5Ewx+kime1RBE?=
 =?us-ascii?Q?+Q2wtt2l0H2VYC5c3VegF2cdI67HXT36hcw9gbHESsHQlF0fTTMtlkMB5aFw?=
 =?us-ascii?Q?A1cc2s8ml/LaPFCI0y5VRboXQz6zr8pOF3eVTG6NDAQdMBq5zsOr8Q5x5xS8?=
 =?us-ascii?Q?51a+w+KwgA0OCyH1iRAPrcXh5myFe2bCIfpXvlMy9uTnYBony64q3QfOa49V?=
 =?us-ascii?Q?Q7wIjyPx//KRK64pCNegEttk3fRyASIMm2uO1Af5bdgM3Hd0NqNi2ivGtGG2?=
 =?us-ascii?Q?i92d7Vekrp25s6XYe+b+sCii43vEb/uh3MeoGw00bz4wFrGi+p5R2OBl+pIj?=
 =?us-ascii?Q?kieunPOMbbQKWtIrSilII+6YUbmRT2geIR2KXGR8JA9coS/RW6tV78C23Fvz?=
 =?us-ascii?Q?+Ig9p0jWnZQKHe95gi7XRyauOK4k3kUIG7GGBhN1pBYAEpQ3/XinWZor+N8c?=
 =?us-ascii?Q?T1t8mfiQr3EKucecWXCoLBJLLbjbFzAhMzkWc3xiqKrwfUgJFiR/I9E0qPJS?=
 =?us-ascii?Q?LSebvaQdx6q5zsBM2kLeiyZ0Y8hevILGnfl58ZHnVmbN1l/BV9X1q1yUtP4V?=
 =?us-ascii?Q?VfTA48YPFStZaZKGAN/VJDDPw2YCZSZFMEm2qScninarba57c7t8hSR+LBEL?=
 =?us-ascii?Q?lGvXtl3q+6df7aQQStFVMXJ0vg4qQN5KqB4VmRqoFb20NzF4boQIvffjmRGa?=
 =?us-ascii?Q?FHE3U2YGWr+c62ePlXi2D/6r5xkjEig5q0Fl+EL99gG2O7dFbhhGWxAmZ6Cs?=
 =?us-ascii?Q?iF/SyRbRusHIE7nzVZL4CvtLWKlSfVtjxWlPmSdY/s2viyYV80QtDFDZ5Ytk?=
 =?us-ascii?Q?WcIORVMsEws9LPNaOq6Y90lQCQFxrY6vLh5iOxaRh8OTn91GRGI6CujI3T67?=
 =?us-ascii?Q?EkuDJWInsMxl2hjLicQKC3F/GiBWmAt0nlqDd7Srkin7pkgfe5HoCs2C9UIm?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eg3UAEZav3RtbeUOKPl9tT+MeZel7rkDAOLqE2q5fmZ7sw9Ul4ggDU3A4laU4Bt2UID2/qTu/iWTbrCcBZtKkDF2UszSRdiH/qiVs5cQnXJuZU4/A1j0XN0rYs6IEVHQvBB6hp+dlALF05eYWgW9zW2j8MowHpvXtqr/Obu6+oBBb1Crvi2eAqMLEbEIndwCrOglVUKvLi/76YWGArZ/bckAgPPhg+5hjPN/5X9Yz+eTfHUBMGGdIfnpbnfN5uG6wDKqyqmDnS0zUmRIobj84ZQ92gkRPrbwLil8+2qlkagBiIn73mZkkFpWmpaKnHa77OO+Y9DWnM2IZeqvw2i0NEH7xIVI/Crxd+k5rGu/WDzQsQimfgjnbxx+vxV2/QTi2F41Xx3tsMeTYSA6RnIMcDp8sJhk7M6Vgijwzd1TM0ngbj/wwv4cqRJpp5EYjLFsovottC50cCKki637Kckv3GQGZTmVry1Uee8a3ahbZX0TaRr060Lvk9FLkF3watPZnlsiEOwGQXnZ+IKQ416ChUjOK7f9exy/olWqSa0fDTKiPlCcrcSgzfZy1v5uYWBWxtwjrTZjGuIel+zwhwGM8OaEkgrQOb9pAzILHOO3xUg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ce0436-dad7-4cdb-571b-08dc86ffd824
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:58.2328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6G2zAhJv5O4i1KFsC7d6X0FVd234THaYKIeETtwI/aDDDqMGUrn/h5xCANmXpw6AVi06U6UOlqdWMgVz9FEPEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7364
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070108
X-Proofpoint-ORIG-GUID: NjU2vKhpZ5KpoBrzPDkX7wFqJ9g-hZ3n
X-Proofpoint-GUID: NjU2vKhpZ5KpoBrzPDkX7wFqJ9g-hZ3n
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Validate that an atomic write adheres to length/offset rules.
 Since we require extent alignment for atomic writes, this effectively also
 enforces that the BIO which iomap produces is aligned. For an IOCB with
 IOCB_ATOMIC
 set to get as far as xfs_file_dio_write(), FMODE_CAN_ATOMIC_WRITE will need
 to be set for the file; for this, FORCEALIGN and also ATOMICWRITES flags
 would also need to be [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.177.32 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFamQ-00035C-RG
Subject: [f2fs-dev] [PATCH v4 21/22] xfs: Validate atomic writes
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

Validate that an atomic write adheres to length/offset rules. Since we
require extent alignment for atomic writes, this effectively also enforces
that the BIO which iomap produces is aligned.

For an IOCB with IOCB_ATOMIC set to get as far as xfs_file_dio_write(),
FMODE_CAN_ATOMIC_WRITE will need to be set for the file; for this,
FORCEALIGN and also ATOMICWRITES flags would also need to be set for the
inode.

Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 fs/xfs/xfs_file.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 24fe3c2e03da..eeb267ae2bf2 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -695,12 +695,21 @@ xfs_file_dio_write(
 	struct kiocb		*iocb,
 	struct iov_iter		*from)
 {
-	struct xfs_inode	*ip = XFS_I(file_inode(iocb->ki_filp));
+	struct inode		*inode = file_inode(iocb->ki_filp);
+	struct xfs_inode	*ip = XFS_I(inode);
 	struct xfs_buftarg      *target = xfs_inode_buftarg(ip);
 	size_t			count = iov_iter_count(from);
+	struct xfs_mount	*mp = ip->i_mount;
 	bool			unaligned;
 	u64			unitsize;
 
+	if (iocb->ki_flags & IOCB_ATOMIC) {
+		if (!generic_atomic_write_valid_size(iocb->ki_pos, from,
+			i_blocksize(inode), XFS_FSB_TO_B(mp, ip->i_extsize))) {
+			return -EINVAL;
+		}
+	}
+
 	/* direct I/O must be aligned to device logical sector size */
 	if ((iocb->ki_pos | count) & target->bt_logical_sectormask)
 		return -EINVAL;
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
