Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A5BADB9AD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 21:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XschZGGH2UYUEayhQUQcU6HKNt8PWRJG3Dg6D6epTeY=; b=bwMh6QUCvQjb5J8cX/JvqvBRTx
	Zp1xFdY8fYLUWeMpwcFUkHUy9hACyUtCs5w/QB98mAp3YaaiS71Fpg7RsEJ456FQacq1JSSJIP5eR
	9GO8Dm842zOXOCO7mP8nV5i5fXKvQt3dy3MVE2B1mVpa3OC9P8cFrOvWkoIw8zKnLdQg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRFbk-000695-Aw;
	Mon, 16 Jun 2025 19:35:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRFbe-00067w-FK;
 Mon, 16 Jun 2025 19:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KpvlWRnPTOUrgrAz3z1PN2LSG5ZnufFLvymSG7NHvtY=; b=DXvlECcHb9BadCAy00lkpnTdvL
 w1PRnQ83Zr0SP1wi/n9RQPxqVcCZQd4IAzaqQyk4IPVc4XAagnZlOQ/Y4jGeKZKQYSu5oiEkOcw+O
 Q0aN4uFUkb/X2CQ/QufZaVCT/0B9p4vdhkN0BGelk9gRnJyBINX6sGrETpQlwRQ99lZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KpvlWRnPTOUrgrAz3z1PN2LSG5ZnufFLvymSG7NHvtY=; b=Uz5S4TxnyNp4LOua+EWRlnGfij
 UDyK43V0mXKtNrMLvl0rludfFxJXQfXQUyJT+Yk8v5vGfWX8uvmSNCIduKE3Yd2+kon4Wt4/rgQhF
 ctgupsk3XuFQYOq0OaRsGfdi/Z/3AYJyvC4wLQ3eMD5YM4D0+qwT71VNRsI6KptIMF28=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRFbd-0008Jd-NW; Mon, 16 Jun 2025 19:34:58 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuW2O025006;
 Mon, 16 Jun 2025 19:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=KpvlWRnPTOUrgrAz3z1PN2LSG5ZnufFLvymSG7NHvtY=; b=
 lg3ENK4935uySwiVbew3mP3ioBME0DBm+BPX4otqoyxS4h/bbtJRHZuzwX+RmXkD
 xYgbFUNKoUlOOlbw28p4tA2TYUQJ4ihtbyxEkKwS+969MvRlQUi1nSz+un0IUHee
 s1JOS+8CIXAOiMda+srpvk+wO+LOMSb4bZm7r8PcbCTz5CyfbLGAgFo9XxPHD2JG
 KAOBb8UQjaPIvNtjUkKKq4AHStyiKOKV1c18Ve5WGAGn40f8HbnRk0Rz2m0wMgnF
 wf5kQwdLlbKOYnptaDbGj9dkzdNzibBeWmmCG74n2u7UVSzV1C34Nq5BQKnC918z
 cP9A4Ws5Rc0n8kb9dyB3Gg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd3nuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:12 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55GJ6DKR025950; Mon, 16 Jun 2025 19:34:10 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012066.outbound.protection.outlook.com
 [40.107.200.66])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yhekuqt-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:34:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8PSfT6FyAONij+1eubZooF83J4tbeR7D9C8pShC7r/cNDoxb+MeZ3VREBdQBxWVwzod0BMi+QDfxWqa5Gd5tmQxRFCM0ZwUURrw0SIK9iLs1p9LOK/z7Owz5Tkm8q/WFifvvkd1kf1XE7iC4krj+nz1mZaXNfAhrnfghXVC8kN4J384d8pk9x2VnQkfx1scDjuGvEb0xusAXOAufnapctAbKFs7pk+OO42xNf9YkARjJ5hdOYf6IjNT7y5rAlJu+U+dNU+o7i7dE8tj1EE5Lon+Fb95rTgv386W6In1tHmgP+VRQXQSGUqZEhCWtTJM99RhJJGvcpfrXRB/TAffDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpvlWRnPTOUrgrAz3z1PN2LSG5ZnufFLvymSG7NHvtY=;
 b=FTelNxw+pjc53rUy02N0AEAGHcJ2QhGwYyIgely16N5kjwZeSdWt4tME/5ilaieAw25Kk5dmv8MCUQzFx6rSdpfp269Xy3SFahJCaP0RQ5xhcsEootxewtC4pYv65dDcPdth2YHSRJv5ha9lPkIyGNDDvbdByMXdutp/r4yxRZn0dsYIbUvyhG0uG5YfE2Y/QF4kJwto2uDjnj/AH+LJUaq2VFP7M5dyTL7bwzqL5hpilESd6JHZg04P7U/PrC3D8UqbGzIyIHif6MBUR8Xs6Lfy53rNwjZ7mGgVxw5QFZBTVVGcSv0vag/nqM5VHwJTgZC7C4O2r2GxbhjXASeYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpvlWRnPTOUrgrAz3z1PN2LSG5ZnufFLvymSG7NHvtY=;
 b=zsJnRGAmlqM/oUWZ7aX+cpdNYZ+PdHC85QCCy1HTzivA/oyZwivRnrBVGrRHI1BHduMcGP+Qb2IpaRQolgs1luGjZ9sIk7HWBTidFYPb4KZciqE2SRd4r1nCHGi045g15jS+11fEjJYmEOTNgj7+FayWVuAlR+cyyJWoNXqahZg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:34:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:34:05 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Jun 2025 20:33:27 +0100
Message-ID: <c7dc90e44a9e75e750939ea369290d6e441a18e6.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 862e5768-ecfb-476e-8e4d-08ddad0cc193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r4Y3bHSEqzAH4Oj9zrWKwIen2uZQsx/wEI8pxwukQ0isF1dg91+lb0QLod02?=
 =?us-ascii?Q?69V1d7XVe2UEWD8UPvBfLMHDnFHZf10mv/LDYjqcJUx21X+qvPivgMIKME0r?=
 =?us-ascii?Q?ru4pjetoneBQUcLCmdyIdeQa26UVzMU4q92pYs9xoQbt96my7MCOBbpfPrex?=
 =?us-ascii?Q?HxvUSbSPDiEBG7IbiJp4t4KePAgi2GS0el4zI1AJu77XknDTWcJRrTA0troQ?=
 =?us-ascii?Q?jMvWVG70x5acoVCP6B34dOiQXecWcDvMk4KKLR0n00vRABWDShz53bA/RAwy?=
 =?us-ascii?Q?AkKr+UfjQK7fiIu0B2UoT+NjHd7E+zA4EgSG8vAkifBnpYhyv1ZgiBxMAVqs?=
 =?us-ascii?Q?mF7wJcDGT5g0onLqFv7KarQD0ICBKQZD0Zm8XeUgEjRadl/q9b8k5vTUe0e6?=
 =?us-ascii?Q?T6e8VsIqnUhVn/kJgKaTHHhHQ3vMebY1DYUu/VuSyWOOpkTPWdqoEpHxnN+4?=
 =?us-ascii?Q?tUNY8JIg8ee/NEabpJKkL3StqI6PI6LwHgTUWCdX+oVnZ8XBMuGnYlnpYiUa?=
 =?us-ascii?Q?kXJNxmZKhjZ0PyPsG/CzilfGEVJa59RuT10hNF1TzZtpO9148AjOWoHSqYGO?=
 =?us-ascii?Q?Exih1aHjYYplrJfEXLaHYeicx19vfSEB2d3V4UIwFTOmziatCXRJPBFTSZDG?=
 =?us-ascii?Q?+x9F8erlf21nHLSK3jEKBVnXH5Iveoy8l5ReEJUAHOjPkmg7j1QPm9Tolt1/?=
 =?us-ascii?Q?/XV3xWjXStqbNvIYZ9Slqf+v+lznqTtE49SHgALd8b+vUkw2E49u33+B/0lj?=
 =?us-ascii?Q?SKdhU1szH6Ix50enJdygRl4mRU+AVgGdHwox0RsrK+PkTYULW526DFfCWlJM?=
 =?us-ascii?Q?pZ2/oQa7gsl+nXZ22KKItuXm2QbmKOlxbtXSXePuMJnNMpXOPrW/Mpc2Ixyv?=
 =?us-ascii?Q?EoPVDjyfjPqkUxOVgpCpRuIoXpnDu+jGh3e/s0ddGqjgXXutbUsWBGyEPYko?=
 =?us-ascii?Q?eVSpMmlckQ93IZzq/npTnEgTmwgvW7k5iBBvsGOaDpC/mQpt95Tn+qx0AR6U?=
 =?us-ascii?Q?R6ZAu90sF+Mq59wY/JqKholqOqFWUqEYlqh/0iP7Sjm8t8bezxyFTF+GMFSQ?=
 =?us-ascii?Q?J22B48tGZCTblfAZhapLJE7pN6O4OS6cnZOYQIwhCu9dilzZpgufQo0Z2clm?=
 =?us-ascii?Q?QKNQTv+PoaPRXoiwMGKTb9S10aWFOwA8ysc0WZeFEkCtv2FToMtWwf3LAdFq?=
 =?us-ascii?Q?IYSsVxR/5h8+drisvISi2Hxgvak9bfEQpz2ZOJCRU3FeAi7UgvOCPCAlg/+5?=
 =?us-ascii?Q?oYugTVJi2HkZnAwFc31e8IbKRtEm9PkqZJ2nEOorAU6pWasgt69H10Qr9+UD?=
 =?us-ascii?Q?4beSOHwfttPnmj9v4UV0WX9eEtY21uv7xroq9ksNTWwrR49DThijeMiRIj8L?=
 =?us-ascii?Q?FjqxrfRsOSgeqRYzIMdryMST8GPFsjkwQVj+gPNU3iG5++ECCZ3FRHf7v3Mk?=
 =?us-ascii?Q?5caELfria38=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+wMDwO7Jcsyrcjva8cDln/6GPcBg2gzuXNWpC+/+3DJ0Q1scNBCvAt+HzB3L?=
 =?us-ascii?Q?WHO6CvuwPbbZH3giWo8zEK2VjC3kp/LfSbQss0lO6KiZBIDET/fB2SHMcMKE?=
 =?us-ascii?Q?lM8ws1pESd30T+Pgf8IR6v8f2wv6bH4IfHVbYZSoYjSYa4p40fE6z7B4wcBy?=
 =?us-ascii?Q?SIIA+Md1bzoIpgMy3xGq3YSHxjGMMyCYVlj9SGKSdC9IOCHlhVN1LY7i33eF?=
 =?us-ascii?Q?ydYE6RUXdli2wWgz6K6aNATTWgIVxddMYREB2oPKFSdT0SrQfJkGsOphgPIz?=
 =?us-ascii?Q?kZL4Ue1V8AvGJXFg9b1keQJuPhyPPYown8V8pObMX1yNmUh7WxjqNcT6w/bW?=
 =?us-ascii?Q?3m1/cYQUEIbxLF0mqGCkvFxqPJlcwRKxzcEVtmIJ/Ksu95218lGZ+pbmpd4E?=
 =?us-ascii?Q?4tlKZndwEZaEtp7UFeLwUy/L5OGvbvDGK58dSa2yh3ZtPh4Mq6tg9O5LxVgC?=
 =?us-ascii?Q?q9ThVjtmAOB6fq7aytN0O4s6vk8ofo1x/t1tLQlQyQYJbkw3sul1Hb/a7Y3l?=
 =?us-ascii?Q?gboq82Ey4W3iw5LMUB7uMaDiW3ytmUTI0TqcKELkAcwEXgg3NBBdoPOd4IT2?=
 =?us-ascii?Q?MTBsAnptpZlfm8Rp7+yRDq9TJKJJLcBgVzeC1RVd7RQk8ObcVXla5rcdGMi1?=
 =?us-ascii?Q?+QwCSQFyfQ/z62SeGTIAPqjc7D031pqKz6Kwok7ZPuqm2Gfl9UlRl1q2DKr+?=
 =?us-ascii?Q?YaxZmwbezvB3XC6zU1PnyFjL2SIr4P3d59YMdyC8d6q26rPxq5db1b4CJXoX?=
 =?us-ascii?Q?PRtJHs3cNlacxslZzgYJ2Iib9vw0Sp+bgM4mW552JOOqAGDTEYM+JGzKiXgo?=
 =?us-ascii?Q?4NOPea4KmnzecIlWeX8NS9n/DI7c0CvaCA7/kTMS1p5DLVmFPBAFe+ikZyH2?=
 =?us-ascii?Q?MttjekLsvNMzlxIkkoUVI15/5tmMy74FpTpRaCr6jOdQjrw1VReluPP7WmrO?=
 =?us-ascii?Q?oBKPg7kA71g8NKQYKpdPoam7RjOpIdhQsyvuhRF7GLSNfuyWAkNHQUJIDUfI?=
 =?us-ascii?Q?4i7ngnrqUiC58fQ/TX7Fw8uw/izy7sDBM017dBq3JBOoW/5YAYdK6PKjTAMc?=
 =?us-ascii?Q?TaQd9NUe71VGtSUW0g4+I1L5cqCr8jIqYv0vNIC1e4TYskt4cYXxo8AanIJO?=
 =?us-ascii?Q?rnpIEdO0w2gsJDvbFEQcpZXbt7+cEcvScTd8MT/XV3Qo9nqTlizN0fDj2ZDd?=
 =?us-ascii?Q?Uqwv8oB5Ibnxo9Wn5+tYOE2ohLBtqg7n1C8lRT0o/szlEKZN/YkOoAcpeCNi?=
 =?us-ascii?Q?pyJfZN92enRls1qGmFx2D0Mzgvxn6PkXADweAjxn/qxIhUM5c7HHWmXaWoxm?=
 =?us-ascii?Q?ynZ+5r0df+2Qj2K916UG1prT9nA1ua1LEfDmleb0LLC5t0ptaFSy+DXdVbps?=
 =?us-ascii?Q?Gbfa37w4ZHpu0TgwLUCfVpiaCWhIn9mDevZyD5D718B/vbE9cVu00zzi++kD?=
 =?us-ascii?Q?3tkLW98L+HZUeCj/SndYLZYGzx8dkj8TTjI8e43sBClTBjIMhdklDbMAUTCH?=
 =?us-ascii?Q?v8oib0UiJKDUm0h3GP/9bIHLnui85JgKU4UwduYZfxR1omaGkzfqLWhCWJCX?=
 =?us-ascii?Q?GETjS8wuXh65wTMGlJy3hSAHmkx0Z0twe4xMyUnzUXY73oye7W5BuLB+Flh7?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zPYaT6ng4wuXkeMgu7S/3E0SD6HhKYznx00eF26WBZnoDXSgFFWv75ta8r9inhHK07A2FMbM88/t+Zmn+YTGeps/iCt4Ev/GbxIjhVbVi/Er8/4BSMui7YjLd4eqsAxzL24k386tHTr05/NBg7J2xaFcigVnVGrdCKg1Q9l8RmvmVDUJfrl0XoQg0eY5YXV8I9rOe81jy1dXElH9T9sDFsCoKdDP3a9hSpO7bfpyhbYqfAvpV1K98N6sujjWI5poQA5k557XWOvk4veveslwR4hfeU51g24gisYufZum8CG9+IACo9Jcu7Wyb2sQkH98/EjmxIFmTC7pVjw/Dvw9x9ZIQpezMA5agMKeU0dadEDCAxJtgJnn8Tdv57pgU9cDDGnOI85V5fc7bqaaw91q+vZkqktCc5f5SLm8O74W4EkXrmaz7wsWRfAEYmc3HFFIAF5M5QUTiH7Mec5xMbc4+w85DcxUudGE0NXlcxV/3sIL7w7mki5IRSKKL0z0rwDbZmF7YgaPvAWA9O4zugo71zYt0T2WHwXdeacuHtHa3qo+zmnoatLprAv4TiX94bzQsgUKffw7qGBa+f5gJqGu2a3j3RrBqPkLE2RSWy+BBDk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862e5768-ecfb-476e-8e4d-08ddad0cc193
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:34:05.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgZBMnM9RV4aYVrCkuPnWX2aQqeuhM56t8bybiaEFM61DwjYUL9tEyr7JPfSYTPr2p4pMU7pUfJwZY0hx4QxfckxXNqWNOEYrXSYq4QrEBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5563
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160134
X-Proofpoint-GUID: c1V9g_sA-aK2yg12ziJcW37Pivo_hi_c
X-Proofpoint-ORIG-GUID: c1V9g_sA-aK2yg12ziJcW37Pivo_hi_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNCBTYWx0ZWRfX/SmipMaMh3Gt
 EkHPlAjdvtVXmrbMdQI/O/R/UPnmLE0pu+m37Qea98p55W1tU0UQ0B6M714WVKS2EK/ThNOo9iL
 R+UU75KJOQd5mYZDWDorKg3O2xvZ0wDkf4jrElTgNsvWPIKKllA/Bk0otGZeC5kqT1uMiEA6jfs
 5Lc540Qy9U5fIkUYtUJOFBA/qMxg/o/GAS9ZLK4beJOp3gL02HJeSWga+kZrkOxoBWMvxwV/jZW
 lDqa4cEwu6klj4OQqRvXyMwAcClRirInTHgSW94h/NxJTBifqk1XwPYmiaUtTP2bftZgGrN41K9
 hQB/17bZo/FL/PrCKtrmDeOhbtqg2pihBynuNgEdtyJDpk1HgW8VrhXR4MM2O0adIHw0b/NiznY
 kY4M+VoBzhT02KIBDkhBu6WuUrnyI4iQt4nNWQ9ss9mFTkwso+84DUh92yYd1tXbW7v1lS1v
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=685071b4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=STwAI0AyetCbPSip0KAA:9 cc=ntf
 awl=host:13207
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare()
 file callback"),
 the f_op->mmap() hook has been deprecated in favour of f_op->mmap_prepare().
 We have provided generic .mmap_prepare() equivalents, so update all file
 systems that specify these directly in their file_operations structures. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.165.32 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRFbd-0008Jd-NW
Subject: [f2fs-dev] [PATCH 08/10] fs: convert simple use of
 generic_file_*_mmap() to .mmap_prepare()
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

We have provided generic .mmap_prepare() equivalents, so update all file
systems that specify these directly in their file_operations structures.

This updates 9p, adfs, affs, bfs, fat, hfs, hfsplus, hostfs, hpfs, jffs2,
jfs, minix, omfs, ramfs and ufs file systems directly.

It updates generic_ro_fops which impacts qnx4, cramfs, befs, squashfs,
frebxfs, qnx6, efs, romfs, erofs and isofs file systems.

There are remaining file systems which use generic hooks in a less direct
way which we address in a subsequent commit.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 fs/9p/vfs_file.c        | 2 +-
 fs/adfs/file.c          | 2 +-
 fs/affs/file.c          | 2 +-
 fs/bfs/file.c           | 2 +-
 fs/fat/file.c           | 2 +-
 fs/hfs/inode.c          | 2 +-
 fs/hfsplus/inode.c      | 2 +-
 fs/hostfs/hostfs_kern.c | 2 +-
 fs/hpfs/file.c          | 2 +-
 fs/jffs2/file.c         | 2 +-
 fs/jfs/file.c           | 2 +-
 fs/minix/file.c         | 2 +-
 fs/omfs/file.c          | 2 +-
 fs/ramfs/file-mmu.c     | 2 +-
 fs/read_write.c         | 2 +-
 fs/ufs/file.c           | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index 348cc90bf9c5..2ff3e0ac7266 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -516,7 +516,7 @@ const struct file_operations v9fs_file_operations = {
 	.open = v9fs_file_open,
 	.release = v9fs_dir_release,
 	.lock = v9fs_file_lock,
-	.mmap = generic_file_readonly_mmap,
+	.mmap_prepare = generic_file_readonly_mmap_prepare,
 	.splice_read = v9fs_file_splice_read,
 	.splice_write = iter_file_splice_write,
 	.fsync = v9fs_file_fsync,
diff --git a/fs/adfs/file.c b/fs/adfs/file.c
index ee80718aaeec..cd13165fd904 100644
--- a/fs/adfs/file.c
+++ b/fs/adfs/file.c
@@ -25,7 +25,7 @@
 const struct file_operations adfs_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.fsync		= generic_file_fsync,
 	.write_iter	= generic_file_write_iter,
 	.splice_read	= filemap_splice_read,
diff --git a/fs/affs/file.c b/fs/affs/file.c
index 7a71018e3f67..fbac204b7055 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -999,7 +999,7 @@ const struct file_operations affs_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.open		= affs_file_open,
 	.release	= affs_file_release,
 	.fsync		= affs_file_fsync,
diff --git a/fs/bfs/file.c b/fs/bfs/file.c
index fa66a09e496a..6685c3411fe7 100644
--- a/fs/bfs/file.c
+++ b/fs/bfs/file.c
@@ -27,7 +27,7 @@ const struct file_operations bfs_file_operations = {
 	.llseek 	= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.splice_read	= filemap_splice_read,
 };
 
diff --git a/fs/fat/file.c b/fs/fat/file.c
index e887e9ab7472..4fc49a614fb8 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -204,7 +204,7 @@ const struct file_operations fat_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.release	= fat_file_release,
 	.unlocked_ioctl	= fat_generic_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index a81ce7a740b9..d419586d668d 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -690,7 +690,7 @@ static const struct file_operations hfs_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.splice_read	= filemap_splice_read,
 	.fsync		= hfs_file_fsync,
 	.open		= hfs_file_open,
diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index f331e9574217..0af7e302730c 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -366,7 +366,7 @@ static const struct file_operations hfsplus_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.splice_read	= filemap_splice_read,
 	.fsync		= hfsplus_file_fsync,
 	.open		= hfsplus_file_open,
diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
index 702c41317589..bc22b6cc72af 100644
--- a/fs/hostfs/hostfs_kern.c
+++ b/fs/hostfs/hostfs_kern.c
@@ -382,7 +382,7 @@ static const struct file_operations hostfs_file_fops = {
 	.splice_write	= iter_file_splice_write,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.open		= hostfs_open,
 	.release	= hostfs_file_release,
 	.fsync		= hostfs_fsync,
diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
index 449a3fc1b8d9..a1a44e3edb19 100644
--- a/fs/hpfs/file.c
+++ b/fs/hpfs/file.c
@@ -255,7 +255,7 @@ const struct file_operations hpfs_file_ops =
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.release	= hpfs_file_release,
 	.fsync		= hpfs_file_fsync,
 	.splice_read	= filemap_splice_read,
diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 13c18ccc13b0..1e05f7fe5dd4 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -54,7 +54,7 @@ const struct file_operations jffs2_file_operations =
  	.read_iter =	generic_file_read_iter,
  	.write_iter =	generic_file_write_iter,
 	.unlocked_ioctl=jffs2_ioctl,
-	.mmap =		generic_file_readonly_mmap,
+	.mmap_prepare =	generic_file_readonly_mmap_prepare,
 	.fsync =	jffs2_fsync,
 	.splice_read =	filemap_splice_read,
 	.splice_write = iter_file_splice_write,
diff --git a/fs/jfs/file.c b/fs/jfs/file.c
index 01b6912e60f8..5e47951db630 100644
--- a/fs/jfs/file.c
+++ b/fs/jfs/file.c
@@ -143,7 +143,7 @@ const struct file_operations jfs_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fsync		= jfs_fsync,
diff --git a/fs/minix/file.c b/fs/minix/file.c
index 906d192ab7f3..dca7ac71f049 100644
--- a/fs/minix/file.c
+++ b/fs/minix/file.c
@@ -17,7 +17,7 @@ const struct file_operations minix_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.fsync		= generic_file_fsync,
 	.splice_read	= filemap_splice_read,
 };
diff --git a/fs/omfs/file.c b/fs/omfs/file.c
index 98358d405b6a..319c04e63964 100644
--- a/fs/omfs/file.c
+++ b/fs/omfs/file.c
@@ -332,7 +332,7 @@ const struct file_operations omfs_file_operations = {
 	.llseek = generic_file_llseek,
 	.read_iter = generic_file_read_iter,
 	.write_iter = generic_file_write_iter,
-	.mmap = generic_file_mmap,
+	.mmap_prepare = generic_file_mmap_prepare,
 	.fsync = generic_file_fsync,
 	.splice_read = filemap_splice_read,
 };
diff --git a/fs/ramfs/file-mmu.c b/fs/ramfs/file-mmu.c
index b45c7edc3225..b11f5b20b78b 100644
--- a/fs/ramfs/file-mmu.c
+++ b/fs/ramfs/file-mmu.c
@@ -41,7 +41,7 @@ static unsigned long ramfs_mmu_get_unmapped_area(struct file *file,
 const struct file_operations ramfs_file_operations = {
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.fsync		= noop_fsync,
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
diff --git a/fs/read_write.c b/fs/read_write.c
index 0ef70e128c4a..80fdab99f9e4 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -28,7 +28,7 @@
 const struct file_operations generic_ro_fops = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
-	.mmap		= generic_file_readonly_mmap,
+	.mmap_prepare	= generic_file_readonly_mmap_prepare,
 	.splice_read	= filemap_splice_read,
 };
 
diff --git a/fs/ufs/file.c b/fs/ufs/file.c
index 487ad1fc2de6..c2a391c17df7 100644
--- a/fs/ufs/file.c
+++ b/fs/ufs/file.c
@@ -38,7 +38,7 @@ const struct file_operations ufs_file_operations = {
 	.llseek		= generic_file_llseek,
 	.read_iter	= generic_file_read_iter,
 	.write_iter	= generic_file_write_iter,
-	.mmap		= generic_file_mmap,
+	.mmap_prepare	= generic_file_mmap_prepare,
 	.open           = generic_file_open,
 	.fsync		= generic_file_fsync,
 	.splice_read	= filemap_splice_read,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
