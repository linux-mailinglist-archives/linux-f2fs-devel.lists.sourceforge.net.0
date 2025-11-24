Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB0DC80A49
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 14:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:References:Message-ID:
	In-Reply-To:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnT1StQSbIUSWyAhBTaL6dMVuIhvfWHiIxD+XykOWVY=; b=mlpQ6x3V9gND/p002ePMR2aIT6
	sp0UZeU8PVrSCOam+1KFFo5+6j9xPWtq78/Qz5c7ewtWtNxk5NuXtJmTETJ2dBVq/4luTotleQszm
	WS/j8Xj0Zwc8cHEB616YQKL1Igw2bv4+rhFbfBfvjgSu5UsKl8X/99Zo23GD9UgKZkIU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNWEP-0002ar-Tw;
	Mon, 24 Nov 2025 13:03:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <martin.petersen@oracle.com>) id 1vNWEO-0002aj-F4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 13:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Date:References:
 Message-ID:In-Reply-To:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pRf1nNs+7k7uMH+fRKlnrtUtQCbSbn9CzirmxxZcUlE=; b=TY5h93aLRq1jPMT9FR3pdgX7rJ
 L6FAzjj3ch9LSr62wSNKbiNS/vSRbupicR67KVKAG0B6ereuIoG+W1IDufsSeI1z4nf3Ut6Bi0CTV
 KIeaDYOOxoWIQIi+R8eW3tGNUHS43gjbipbsV0G1TG/Y7oIL+79BE9CyekQuo2IOS1Fo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Date:References:Message-ID:In-Reply-To:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pRf1nNs+7k7uMH+fRKlnrtUtQCbSbn9CzirmxxZcUlE=; b=Nh3NWonG572UCTYSLOK9IpIfcX
 Hj1pb+6H1gZOPMxMuU6sD/j9tmPHWd6krkNoy6MFGVGmi9Xr5f0jGGe+HM0/v+hwmBngSK0RmNB1u
 RTr+uRPWgQ0TOo9BmOltl6tKN2oFcTVKWcOcwozfTNl35Rq3E2VhzO8rDSTCHN9cBTUY=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNWEO-0006f8-1E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 13:03:48 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOCVGvR1038231; Mon, 24 Nov 2025 13:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=pRf1nNs+7k7uMH+fRK
 lnrtUtQCbSbn9CzirmxxZcUlE=; b=p93ubr5SaBTPqBPK5454SWSlcA8LETiW30
 CYxafFOqK4vEtKOKJJGZZmacklsKsx7VkMpt5nxeNZWikUh2I4BLIX1GIYMwB2JA
 4Fk2oFBycj1pYgPHqAqe0YNKB+SguSuf++c72a7pJpFwnpyagnQifr2v8fFLI+9g
 jzL5qpWF8klE8oLSYMZ93LOFRNcR6tly6FELvJU2/x1orN7s+ELM+mSPZi05LUdB
 Q/Jew7coXDKXCqFzZh+T4KD+rlCo4VOCnCVeZZVOqsnftFLqRZMLVaAoITKr9NPO
 fhcanqX3JN2X3kxiO/IrhE/Mxp87OLEfpPWif/HRngiPHaiVHFmA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ak8fk9yjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Nov 2025 13:03:24 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5AOCoZf7029743; Mon, 24 Nov 2025 13:03:23 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013008.outbound.protection.outlook.com
 [40.93.196.8])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4ak3mbkas3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Nov 2025 13:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocwdZi7T9n5A3moXynAVGyAJ3PncdltzKU8GZwHJ6UE6Z9XmM3UEgVYK04fRGlaiY9bptrPxoeRZramf0S5YVCA8vKwJPtiIrilZmVHueNdccRQAivN/AOire/u9e60DAd7bx+eDcMS8anUshB6k5MPKWtss3pEI+tuo4jFemtKCVsYGHIPj8QM2gb3XpYZNmaY1255Of31HIvdoqfIDr4dpsRmMx4RC/WZ8Ae/E/bvQ9TeQ6VJWsTzPruq8Qhkr0lup3JDML3yzLFsmQb39AAR7N2n5mCzCmJd0xn0EEyWQ4VageyExA9Nd7YlLufbtv7tg3OlEvvBosWhZjXYKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRf1nNs+7k7uMH+fRKlnrtUtQCbSbn9CzirmxxZcUlE=;
 b=SKnjV6s3o5fmdK9MGzxqBLa6xvCvaNeMjCMj85F6PZoSQGPJLp9CyAAcvXETdfvH/HTT53v7GChrvWtATSvs3ZKLEYfjZt5SH2GHQzoxRwe5npcqLIxxbLCTz3xheBEbzvxH3eBh4eQ0SyguenMYTOjV/eLb+OaDoP8mbekxxJHKOaJALjS/n0maKlJ8jSc1QXDs3YTb/Spgmj7foS8oTwhp1IgbIfwVxxcOIOUcwHy4ZArPhxTS8GUr2VGiVB3L1Pnq11pX+MmAE15oTJ+aDXdmSEThvUssvVFR/5KcR+WQEJfeLWVp2XyV6XsWuFKqK6yf6Cu35fzzYkrVROtBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRf1nNs+7k7uMH+fRKlnrtUtQCbSbn9CzirmxxZcUlE=;
 b=ye4ZmiBZIE+0Hq7vnNjBuQ0KJz+jWcOJpncyr9TrL/v4wC5FmPkAdVNLeecypUhm20rVEf4jhTzP//wa5zQJON2uR/4H1rtOQhJamCGR4/JSeWkjLahJHv2PmqsnncZfJ4DdvQ5wfUzLC8Jx+OAY2uky+NQF1SOAmdBC4teZHNU=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by PH0PR10MB4743.namprd10.prod.outlook.com (2603:10b6:510:3e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 13:03:20 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 13:03:20 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251124025737.203571-4-ckulkarnilinux@gmail.com> (Chaitanya
 Kulkarni's message of "Sun, 23 Nov 2025 18:57:35 -0800")
Organization: Oracle Corporation
Message-ID: <yq1fra34m7v.fsf@ca-mkp.ca.oracle.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-4-ckulkarnilinux@gmail.com>
Date: Mon, 24 Nov 2025 08:03:18 -0500
X-ClientProxiedBy: YQBP288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::25) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|PH0PR10MB4743:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa03b2e-94ef-400c-df4a-08de2b59d7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wvOciuuXAKTwPBrd/shOklCxs7XZCu3G6EqncRQaPz/fxZm3OlmE2sx3BLce?=
 =?us-ascii?Q?3JKXZzbr6zoGeTHeIPca5g4WIDxGXqeNs6Sar6ZWFkC8uulnYQDZ8+7IasnK?=
 =?us-ascii?Q?4dihEA8WVrAIKkqwLxhgCB942kTpKbL/2gqY6rwuX7dgfGzT96EkiJ1V0G6e?=
 =?us-ascii?Q?fQ7j8cLqp24ya3kfCnyM5TxQ3Uem6iwv4Nisy3arYb4cJ4IC0q2qliex3b7c?=
 =?us-ascii?Q?HlyGFDaaZTWM6tC7nEuqh2bFEoP/yCLltvEKx+BBMpqYOg+b+yW8jrsuz47G?=
 =?us-ascii?Q?OOufYSoOMhhSY5IU7Fu7gooHnz/5/3uBebv9f6FzYhyjXtJGoU6LLXX5o1k9?=
 =?us-ascii?Q?x/60rbhNsdRRi1edN/YP5QA30QMokNnTbrWUt+gjEJdfoIVXdgfE+9NApbgU?=
 =?us-ascii?Q?YLQUFG4eY0AdX56QkpSENuM8/xJ7xqkhqt6YLpOA4I1+ZdRMoEwvUuuwKiXm?=
 =?us-ascii?Q?bgDQOPrP5R44TUQ6jdbgHpk0gpC36+gwSitk8XyKMczCkpOA0kM2WYXNvdSX?=
 =?us-ascii?Q?f5U8b3VvGLYh1b/fem2TTd+e+ACw0OhvJhBsLMn/jC0x/MfSvYpIgcMQi4Vi?=
 =?us-ascii?Q?rOZ25Ydw3bgSTMhSvBWckBKUjXhadhYzboCtnKLX8qQivcC0LwY4FdX0Fru9?=
 =?us-ascii?Q?gQs5H/Zg3OXgqDHc0toeuRxsvvNJTKT1Xc7ipg2wHaWHMjEnsEuwi6VouXmH?=
 =?us-ascii?Q?swwwKgn1tOdLfOors0Sdg860CO53VkRAgFvMI8/hTntYCl5iZKNP0I4OAILy?=
 =?us-ascii?Q?t7j/5F2N6wmyXiCrBwltxfnb0Kp5FVLQ7fyWU8UiQ3RHgyD44ZIvp3L1syTZ?=
 =?us-ascii?Q?3j+YRTVtI65tgLTh27uXRri8fjZ3MVK9ZPzXLEJYoteYUSUCdybQWlGZLdY1?=
 =?us-ascii?Q?QBaX5yI4gfBtrDz2g5diwDTLWP4cRpzVd7OZ964aZ03RZynMhV12sCqcjqWx?=
 =?us-ascii?Q?oMBlFi0bnHlqmuseeB8ArSbuUn9QRWPYvZtnpyN/xgvrUZUQckaEMbqzdczr?=
 =?us-ascii?Q?e2qE/FAnK1MUc+k9ZTS+Ziz4GJcy6B4uvME3/AquZHQBmUGXs+4Bl9iaFyz5?=
 =?us-ascii?Q?7X0GBe2oABD+M0Azh/9vciumX7QY8KmzUUnu7i/Bn+FfMEF2ISxy9uM0rHnj?=
 =?us-ascii?Q?ISCZ023gTXPnoNsQroB7HILKjF5BuN8xp0EssE/1jTPTdg/C26rCChmv7ctd?=
 =?us-ascii?Q?wZNWLyvtHxfQteybBSkj0c3OE3IOwZDdtoGXylTgiwONQldTROXHMajaVhuM?=
 =?us-ascii?Q?1Hr+CvnamahWUpG87GEV6Tq2y5vIddzG2aCCUwYkJC++XEXT1tCxc/iahPro?=
 =?us-ascii?Q?2HDSZw8zfEU8UFYFuY2lhNG/ZdeyFMIsohyG+VPL5AoJsAIzP3PACwgVMpLi?=
 =?us-ascii?Q?qRk4GZ2X1p60pXyetoYzOF588R0xzOzHZLgAIF9/V4mqJ0gwgIslYJZ02qFu?=
 =?us-ascii?Q?J/bYvbQgn2nhR0Tq1SPCkxZ5AJkkjS6S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5338.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YQTOD1C5B9LwWpdhThunoovyaSe5n59LijDoi3iduwppMZCdmC9DugZy0ugR?=
 =?us-ascii?Q?3jZO7PBXDRxJ1vQZkiJyeo4t82Qwg1MddWdKzs3x+h9gWW9ue2lFf+kQHNOM?=
 =?us-ascii?Q?Wvp16EsvnM66tB+irGtUvojH5Ck7w1QWe8iaQUySBxSqVSxRYgRMfvaIh47r?=
 =?us-ascii?Q?GW6xigngU48fzZWd2PslUoRvBu4XYGLRaQs34vqyaGO7rQrorkwuTGMPFU8N?=
 =?us-ascii?Q?vxhlJWhPflfVd+y9QhFK9WFMIEsRVL2vnfj8D0wZNRlt1tsWIdPY6h6mp6fH?=
 =?us-ascii?Q?R/an9jztpllg4S+7NXrGL6ermn8vZrhXOe7M0bjLqhgILL/aUB2gRJjhNDcN?=
 =?us-ascii?Q?R2TCQG1mthctYU1GaZl16k8XoOu5CtGkbS+SZ3dw9M5fnV9nBA5OSGj1IB4T?=
 =?us-ascii?Q?wO3+rN2adP8wRbiO9tjmZObIbjqayTAgqfi6x+OYq6EXeqG39MxX8p3SnswY?=
 =?us-ascii?Q?9/yU9okUHCPswJcowyi4PA9KkaRM+dzNSXcKnl4Iqb6HWjIopMP0qDvBpQTu?=
 =?us-ascii?Q?5uTcQdZdGxw2JL/tsIbi0mNb7t7PFVTS6qBIbjXXc3JiE55Cl2nWkgA1l2at?=
 =?us-ascii?Q?ArkFe8obGVnE6dJImoYBCH3T62KqJcWCSRZeZL2OLgYLTyQnugy595UipTZF?=
 =?us-ascii?Q?mhojBNxgF7UXNw5XyG2s0FpepjlJGmfuP5TXxXi7TPRwA4xGmTxkqLCukFT0?=
 =?us-ascii?Q?r/M21uH/5VxXQTcHPskPyNO3ff5loAlc1DBbtEnW8AUiZleb/l598reCBR8K?=
 =?us-ascii?Q?Rtvyex4v2FRcCyiBGSEArEQ8Vn57bNfdwJktuXJl5WkjLTaRuvcL8PvEFIqL?=
 =?us-ascii?Q?lLCkg4LqrA6zTnmsiP/CVsXd7VmdEa9zcqN8NWVdiRexQXlsmHRZ/uDVKqvf?=
 =?us-ascii?Q?qYVGgXd9N0S0+K3vvlN7yRcyZx6c5IlhlAZnnFnD5E1modtf16z+XAMBPWCW?=
 =?us-ascii?Q?qS5C8Y8Chc5lWfM+qRORn37qMWL3j7BDJs3tj2SsH9UWJ4iNXELMxhibB3UV?=
 =?us-ascii?Q?HY3uvt90cuiRKk7mrhG14sxmOGW2H9pPpiffKGI3Ti+UoDtWliHkAji/XXMA?=
 =?us-ascii?Q?m6vLTuPt+GdiqGne7tlUmj8XlDsixH4OmljiwAfZxjL9bikJBuXReNGL9LR3?=
 =?us-ascii?Q?jte+ECGZ7CDZ96gQoC9SAXfj44ED8m77arWaQlydiTrjx61jDJQJfJ+Oj2GG?=
 =?us-ascii?Q?JSrq/cbZoPUj9OpFnIX3HncLaMO9Er8gw3jJoTY9rBrxTTjJVN8L9kc68kW8?=
 =?us-ascii?Q?2pfsDVzOGOmCLuZ6jxj0rripnSooeMWQ+/91Vhe6dUx1h7QSEa7GiZob685L?=
 =?us-ascii?Q?qUM3qFgK24QsxPELhKhz7XMeSwr/OD8XG2ooTxcU2EQpwOFFVvS0xj+pn+2p?=
 =?us-ascii?Q?KUg9kaXCh77X4St6l3OhF4mUF2v90gQNMyYcq8f0zNzCp9IOp+gLxnxJ7+cv?=
 =?us-ascii?Q?xpEwRTUVnHWSBqsMz2VU1X6x9Vo/+xZFMK8NjpSstpl9vip1cJ9t9ae79s6y?=
 =?us-ascii?Q?N3eT+PwfpDmPnF3YQvZbxFXvVirNUkwhKDMSji7kIgtiCZNjz20Mt+dGMVEB?=
 =?us-ascii?Q?YVAZh+fAAnjJjIQAu6W5grJ0dbRsq3vLgPbyHVIK884gr57KQkm8YT1oxsGS?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MoguubVr+Yvz3pKHMmB8YUztRv1k1368UXSQtwe3gKW7agBqfpq/q+kWRVfzyyjrVvOecC8kKZC46086fAuIoo+B23mXhBQ4TOJ7qZXKLT51lvxPp0sXFRAP8lRpBW26k/ge2kk9b/jXuhne1IXU/zWEGXKZ5gbIWI41eYCKqHJpFZdf+JLN06+11T3d2KuyEU0AgghMW90pxEUTLDoP7V+oIQpUAm42xeZ6yesSsFm5C/HFYqDaDNZv3H1BXM3PeEN5MHw2ND1dh/JgmfwgT/5j73EFOiLBX4hApVAg70fjL5CAYRYwwQN0ueIsbbQa3xaeHjuNKu+qHgVetcAwCP7gEBsbB5TLMwAWzjjRmuLV8OaM3Ia0WFy2YjrqLFL5KTQfW4xyqbZr6TnEHJiqtak1Era0YYiQPBhytm72Shh3iK0uAuVR4nNJO+OOr1ttYwVjAS7YmQcTc8dMzOMjEjGYJnWVJicso1+tacBPSiTAL9tdH/1nd2LW8c+KHmbXg/TgQn7uLfaISgrZYDEHdCwNS7/kiYXZrl9M4ru9q+qBWpp5UzLyIYCvur39iW+JVaZfwNUQdDs8CApPoxpygWYf3jgbpINLDyUTehy0vpg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa03b2e-94ef-400c-df4a-08de2b59d7e0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 13:03:20.8111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OD2qnCxenQCEQ81BuEnNwmVx4I9jH/mOlsv6vW2UT/caTqP687iAGtzLxCq96/QeQL3z9dCepATiXIOX2e+Zj64tu5KJMk5yEz09buN7o+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4743
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511240115
X-Authority-Analysis: v=2.4 cv=f4RFxeyM c=1 sm=1 tr=0 ts=6924579c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117
 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=pS1GTPjh-CLonHFnBUIA:9 a=zgiPjhLxNE0A:10 cc=ntf awl=host:12099
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDExNSBTYWx0ZWRfX7LNuWMxXa81n
 XeyIRHMZpKHJ9OrGgMBnJ8RqxGRhXUO+jPihBLWCpS7ZsDDwGhSe0/j+eOwAkuZr71uO5ulPDr8
 OGKKlbjS3Z1WRuWMqU+FjWfkXGBGhJBlH458QkcGs1639wvRgkm3xHveK3xzaNbk1G1be9vxG0a
 J5ZefXkeusicr/mvpQCz3KhQkACZdZi2v5x6XQAxEqndPp9hNKhv7KIyMo0bW1wcIGIWD3VbeVM
 6Snfx64hedErznw5Bs4gRrr9drhngVHGwUarphrEFzMedQRpjZ/Yw9AmX9FiJ2wdeVmixcBx3C0
 ven0dONKiLdkImj74+nrayg65UwYcCf+GD2jtks0YfYFCg4Mi8iNj0F2X6iELFowfMOvL+e+ISm
 JSClKK1VlharbcV+TrZ+OZGbZuaF2R78wgnvwGewhCVYcNbiSsg=
X-Proofpoint-ORIG-GUID: kXQspcN7EkAYx3TIiXbIDq_xRWGDyMdm
X-Proofpoint-GUID: kXQspcN7EkAYx3TIiXbIDq_xRWGDyMdm
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Chaitanya, > __blkdev_issue_discard() always returns 0,
 making
 the error checking > in nvmet_bdev_discard_range() dead code. > > Kill the
 function nvmet_bdev_discard_range() and call > __blkdev_issue_discard() d
 [...] Content analysis details:   (-0.2 points, 5.0 required)
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
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNWEO-0006f8-1E
Subject: Re: [f2fs-dev] [PATCH V2 3/5] nvmet: ignore discard return value
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

> __blkdev_issue_discard() always returns 0, making the error checking
> in nvmet_bdev_discard_range() dead code.
>
> Kill the function nvmet_bdev_discard_range() and call
> __blkdev_issue_discard() directly from nvmet_bdev_execute_discard(),
> since no error handling is needed anymore for __blkdev_issue_discard()
> call.

Looks good.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
