Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40F9006E7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 16:40:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFam1-0003Kp-3k;
	Fri, 07 Jun 2024 14:40:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1sFam0-0003KX-5J
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJpgAtqzqy5NPMAuN6MwKwGQVoR3/AfpA32R9j58sLA=; b=JlVgx2I9Kwv8UtrHPjnSx7BJIR
 AxSDehjSO5OPlQ8gHQ+jfnT/vn0jB0CnWrPHyku+Fs+lOuxejyE6IO/7tlDSdhI7I9UYHjb1Ed069
 4If+2skvL0iHeX7t9vdgmMtFZF1KaFMHeo2Wq1PrpJumoerYObbMDXrLHV+DdIQQdJEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJpgAtqzqy5NPMAuN6MwKwGQVoR3/AfpA32R9j58sLA=; b=mlnZhwUYPkDaqpLHHQkuqDDqnb
 WDeyhFitiZpHLKNu4adFGGcFbZVzpAwKU4gK3GZY1l1oyVEljch18NOjbnfncJ7ArbrWC5NGGTV6c
 KAjWNzEDhBDz6+psWcJIpSg6exVAUfrmV+CH9o6AcvykGCQ2qjplavi7SR31vniwXiC8=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFam0-00030P-K6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 14:40:56 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 457Cubgq015428; Fri, 7 Jun 2024 14:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=IJpgAtqzqy5NPMAuN6MwKwGQVoR3/AfpA32R9j58sLA=;
 b=klJmI4ANoOivX5txJd7kIhw5bQkn2/jaNvymprpnjzCnEkao7h7pTYi2dek3msu4zacc
 mcABftZ0uoz3qr9a6fMTbeZbOXAINLWv3wIB927/GdzGGf2MeyPA6Gps+nMpI6U37Wgw
 B0ifFPGEdh1B/a8ka11UyZb56fxQeWsx4pyzf8Nd6bhjiC6JNY40uiB3d/Ru9VSh/vgu
 QZ2tRPulaRfeC7EkpK4qeIggbAe8swy7WWdu7xHeb+1J/joiwFKggx6LkyQyScExz9qX
 6SEjfoIT0BKCF5yRsvbMCfy3nI+lv0aCxPcvZ1R8navwLFJrGqFWQtYutQ0DoSTkGIn0 5Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjvwd3tg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:40 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 457Dvif6015671; Fri, 7 Jun 2024 14:40:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrjgqmr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2024 14:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klglF8A38GmIMJJn0JUJjfIZU66ZPYyFK5fBi/dibhgguYVETqTIsd+TKp7NOrdqawzduRt6b8LeJ662QMsOZ9H9c/DU84hrui+G5FB1zsaVlUYY5+nSf2c8/S8JAMCjSivBodOQ5wf9XVXl5Pw/1FV9s9YyA2l0PKd+OQdtcsUWCnxZ4cs0vW/gp/LfqAc3baRCoxYrR4g7gwjfB4QLVrtlRg7NejkaTZDUFZI2mREHjXcpPVHJrSPvvcZw6PKj7mgNkqB8PG8JKAberrfwd6czL99bQm2CowtKm/eND7lwzOUUC1bHA6UhV02IYllf7QitzTy1p5kTsQfDW5cWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJpgAtqzqy5NPMAuN6MwKwGQVoR3/AfpA32R9j58sLA=;
 b=g0+jFSRQ5saZp1ypFMbTQexykEeR98CPyBgtuTF6ljADsge+HDN1fGo/i8830IaYsI/LKGd0NllOKLBjC6/2nK8Kf3QJD3PbL6nlbTkMivRbfn7smKoFd+i+NL1TBqDXN7lJXmnbfkhhFCyrrSU2nMOJSpLwEUCSPMVQxm299hj3ctxMcBmWXEH7gVwK3mp8EQvHoMEH+lUjUdStVdx/gLwvEJ9yHKmUdoyqxaMJl3qXliS/nOrSxIxbzxWLHNJg36yA7EGNMqmT4ksiHyWfIr9bClOsuKu4Wj2IDa4LffN77hYSEgB61JOwcmOgpEyGPp5uoho4k7p6+XT8ObPtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJpgAtqzqy5NPMAuN6MwKwGQVoR3/AfpA32R9j58sLA=;
 b=qhZ3aevCaR59nPiCoLQwl+XZBhIj05gSBT4Au8nCtX9hoau2DYj4OZGG21miL+1OPL7H0KmYNpqnZfUgvMH3QRv7Wm55vKRcklf8cOnX4f4baBsUXWpHVkw1MLiRnrbjBHqeabs9YKI4TWiNhsFwrfVtliP+L5tVwVi9eKD1PvQ=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM6PR10MB4170.namprd10.prod.outlook.com (2603:10b6:5:213::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 14:40:35 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:40:35 +0000
To: axboe@kernel.dk, tytso@mit.edu, dchinner@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, djwong@kernel.org,
 jack@suse.com, chandan.babu@oracle.com, hch@lst.de
Date: Fri,  7 Jun 2024 14:39:13 +0000
Message-Id: <20240607143919.2622319-17-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240607143919.2622319-1-john.g.garry@oracle.com>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM6PR10MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: 7186dd60-b7fb-4afe-f373-08dc86ffca55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8HL/RZFKR9YNFtK8exgVxgqGYTu74V26PDzkoj2mP/q4o0D8qT4BYVvA0SER?=
 =?us-ascii?Q?igIc7mIl8kyYH7A6hw3MicGuCsTd5RctzqklO6StNXhli70k6eG+IhZ/oXQP?=
 =?us-ascii?Q?gpFuPyaHnqLJbvy25ojsgVKirMLjxVlTIXachCq6lRb07r++RVyrhTDaeV9S?=
 =?us-ascii?Q?AAsm/IjAFCB1Cb/DQmj86RXJXcLCCJZebWP2tdatJSFa5AovAkQgIfG7REFg?=
 =?us-ascii?Q?Cc0GDxlgcV//DvA5fM8nsFMVhvPo76CNg/XkM6JQPwu2/PIsLIEFUqJZH2Qt?=
 =?us-ascii?Q?X8TPhaEU1/UMGwU4sCuXIh7UQC+rTPinDTVymw5lueD0uvCfuKlxPPhGwXzF?=
 =?us-ascii?Q?qfakd1esXByn4fC35H19kNjZhDMPe+TKghUebAKkqElzIMs/TJX1/wdwOVV4?=
 =?us-ascii?Q?xgxbcZUYKgqmIco7usYDNCwC9LFQyFOS/lkLtKvvIyh3hKoSP2jqhLTODSB4?=
 =?us-ascii?Q?WfoVFucvTe/hAM8o2IMsTBH0k8bLYedE3J9xa61eb8RGvftHv98mHie0uviK?=
 =?us-ascii?Q?pilEqlHI/y0+i6ejEcFEqWsMnfOBxdN3JMCyipLcLtYvtgXWPFxnWpY2MCam?=
 =?us-ascii?Q?gkKHUj11ftsyt5bGC8wQnk7u3fkR8iZ9bBRdMRESG0WX/q1x06w6SNhFb5TL?=
 =?us-ascii?Q?oB05GcQLNjh0bu9TE9JWsV8emPEd3th0wHD4iwbD/lW1SiBtOC21eDckO79u?=
 =?us-ascii?Q?lkq6DX0TPbnkdNHn9Y0LuA97qAWRgblB72GBY5RucvfSKkmJ7s/N8W+fbK54?=
 =?us-ascii?Q?ZA532D/rQCaNULDd84mSWGfNWhTBQh84u/ECfqyBSScdL+4JAL2kUoDl9qYN?=
 =?us-ascii?Q?eNzQTQ/Ip8oWm0t1z99alRl8bPDBxGEpULeB+dxPUv9mpyZBsCKPSvgmFpFO?=
 =?us-ascii?Q?oZDTOXmh+HGyfM+s+xhOo6EPxUzEDFxCIRL5ctrWbpywzUnWeXfIU58NWbeG?=
 =?us-ascii?Q?a21wh+e3DkLK85XIdK7lKX4kaLuGAw1zRIudKxokpg/O+qOavtet6Te6MA2N?=
 =?us-ascii?Q?81IeWWMMlMJG27txm9tlqOAfFMlKUpfP7MqwM8nt/eNwhFtELYsSauwUoQxE?=
 =?us-ascii?Q?47FKXseA28k7Bv4Ri4Xv1eiq/TXEyhsL6P+MK2cuQ1G5w8sROpevAkIVH5Do?=
 =?us-ascii?Q?vI+ONbAufSBAYBC2JPF+esmzcJH7d4xz6Di9qV1OAVugTVWF+OzXVX2wKb+M?=
 =?us-ascii?Q?be2NQH08q1s90gowNCICYWaoXMXeGAKtHnLFODtK1IAOd9CeoifKyzisw2ds?=
 =?us-ascii?Q?6xn8Bghw93HRW6zRediCjGwA0M3ZxgSxK7EghS9OYiF7gccnCZH+g0U0MQUD?=
 =?us-ascii?Q?FU2t4NoU1AOkWi79JHkBGuEO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB4313.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8CHTtW4KwV80kzC3+w3ISSed5YSuFUY87a3hYm+yfpTdhuz3uuvpfaNfA4xK?=
 =?us-ascii?Q?H2q4FJ8X9+bfFPSGD0L0aPm0ZyX/OaE61814L1L6L/SMtM6P87TRlS5vWkwS?=
 =?us-ascii?Q?nlFnxdTQBFmiE9aIZIt/iohjVGulhShBOJNe739/Fq/NRqnyremOmnnlOybB?=
 =?us-ascii?Q?C+l/yjhtKS6iCBmQfxSeP3lyuVSnrL8CuCKwi+rRHj2tiR6ioKsHK0tvp1e3?=
 =?us-ascii?Q?oZqaQ/bIz6a5hdnAab6qbSDXiZvNmrs9B18U2Alt6G1qBWqPKIqB7zRa3/mi?=
 =?us-ascii?Q?02sl/BU2HhYuy4/t6H4lJKfkSz1Hxo0ddfGojJnoaZfitZNipHOOJxqMvyMl?=
 =?us-ascii?Q?P/QdCebgBRV/JuyE8NYdNtGv+HG1g8m6z6BNUMGhN/M2r7TLff39ud9KhBtj?=
 =?us-ascii?Q?EVRtO/N1uSUUYlanz4qyWNQKZtX9nQeVQLkWcFgGnDOb90d26KcUBdfxP3/h?=
 =?us-ascii?Q?AiTHZN3BovxIEAibu5AiBpKCvlQ/6q7BvL1MphhuYlJcpTV0kuZIhIedkdFU?=
 =?us-ascii?Q?gFxo9YcfY8RLMR5AApl1UwX1UrQbMw3KOKGDKBIYtPgAXe1DHPGt3SqVIuvG?=
 =?us-ascii?Q?ECk5M0FFFVHBkVj5HhdBeBIw+GJR8OVEGK5qvrZwMtJQ7W5mu6qDl+sk6bf+?=
 =?us-ascii?Q?d5ru9FJ+OlEEdZyZe1wCH5fGOSDOTCFYVLXQd+c6n+CyAK9Vq1UJiTwHrQyh?=
 =?us-ascii?Q?yxOruE6MdTRjpYWayMKqeGVuEU8pPbuaHBpAsFAzBXXRsx3VJbn8s8o8mA8L?=
 =?us-ascii?Q?63ehtTgU0Xaxx7MhXI7+JxhM7DBNs18G9tWHqeg5dFFyCsg3+cwCVUdHVAuJ?=
 =?us-ascii?Q?Dl14latEgKGMEcR2BdvaBHrswDfFqPhxR4Iwjm2TPyF00ZEbPmAQwX04RRvw?=
 =?us-ascii?Q?KgcrM9SwX6ln43wLNW7Fq6KwwPR+rSIIqk0FOWOYZl1xHfEEe8QXVJOOIoel?=
 =?us-ascii?Q?p5UL7VmSQocnMl9C3O1rGr0gbtuAJaVk47FP6y2MqvSW2bCTkDATiU3ZNODG?=
 =?us-ascii?Q?Qkr7AxRRJecrgSE0jQmmdZ01GLpjKs0+VXy69O0YXfm5vf/RT1PjKo4GuKSx?=
 =?us-ascii?Q?Tnn0McOeyKp2Q5k0fCC7oFDF3Zgd6MltVYZ6gJEVaw5D/OiFcMeoE8+0yoFj?=
 =?us-ascii?Q?aiH/mcJlceSdQ29yzoVKk9YXd9hejFNol39YXOnhoHr9IXA4Dv+VQK2kmg8w?=
 =?us-ascii?Q?s/lRvichB/7MN2eUFhX97c54uVW/f69sS7GAdsNvQ6g1RNGUdUn00h9RDnZR?=
 =?us-ascii?Q?85lIgh1KBd6I0RZ6J+E4RTvQfALUt9dApgP43VHVa6pDNcmXvP8XK4jjCTpy?=
 =?us-ascii?Q?DJhjHowgYHsZRIwYfW4kgtWLtztcvOXxtuwxJ/Ke0q4mdYex5X318tEpuu+L?=
 =?us-ascii?Q?tlG+Y4tVWnK30DkTOyubteYnEBQ/WG7A4fkvC4Zko5X9dizZNohJoUPDVTFN?=
 =?us-ascii?Q?kjF8vHmUK4MWrmQ3FC1YbHv52XuuLgm5R6cUId+NzowZcb2V0fRKXPGzpRnC?=
 =?us-ascii?Q?7bDwdBbJhZP5IY9cH6PmqC1OwihfGCuOWvkMKHYJ2vZxPP6M0nhpLw5jdMlM?=
 =?us-ascii?Q?h3Mx352CyR60wjVkj7dvzN0SnLamErS9umWUWxT6LLV3VlEBucARAoWP8p6o?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: o1x4B6jZwjwksL9ZF+YFDex7msdy/wTpkWqPlaZxoD8E1McmW68jk5qg/xGMx5UZYaj9/USB1gSCT4kv/LmkJZ7OdQ7bv1YBDHIlpnTfAHbQkMfAcDu6Fb+0AK5XIMwBBuMAxl+B8W/vxQxbANnZoRp1GK9NSwsSnDpr7RAGFY0euCbkniEz8csiBlFiMtSbFuw4VaRa9cylGG+G+3hvp3NkQq+Gp/GsSBMRl6CdNvSa5y463pQQhd0hFYWOhrntNgdYGSv7aILt8BLyNIW7H5CebKrCLs6RZdpjCMzUO/3MtJrsKL7XGmZ6FYC7S9GJfQhr+fNbbhe376iPstJokVTOJGhKiLuJ57r1jA7QFOVlDvq5+E5QuTynAe78LplqNnXKUAnDIxldvz26n2+QBXtmPPT6WtC55qSp7Wg/np3wMVCgPHJh7ow2Q79eBOPQJ4uDia9uaKff8j5UV/XbcDVp4E0+al1AjUKyttZo2q7oZNPlMwMJ7GXvQ+vVlsv6Z/SFt5HItLCn2lqIIn8k89Iw/pjf3+oPnTCzZtSMxlvqXNT4XXNag5hlZHlW9uDPmp78Q9DOQDk0b55DYMz+25wwUV7x9rK5pD9fwHXH9RM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7186dd60-b7fb-4afe-f373-08dc86ffca55
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:40:35.1067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jawORguDgDcvbXjhpfw2+R07Z4pF1DJCpZo6K2/UvlAhALHoJbUhQdzKHAinF8pLdwwdBQnR8LPLcG1fjbiwMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406070108
X-Proofpoint-ORIG-GUID: Ext6cxMLanzXPnweipuctpwF41ldKGdm
X-Proofpoint-GUID: Ext6cxMLanzXPnweipuctpwF41ldKGdm
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Darrick J. Wong" <djwong@kernel.org> Enable this
 feature.
 Signed-off-by: "Darrick J. Wong" <djwong@kernel.org> Signed-off-by: John
 Garry <john.g.garry@oracle.com> --- fs/xfs/libxfs/xfs_format.h | 3 ++- 1 file
 changed, 2 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [205.220.177.32 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [205.220.177.32 listed in sa-accredit.habeas.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFam0-00030P-K6
Subject: [f2fs-dev] [PATCH v4 16/22] xfs: Enable file data forcealign feature
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

From: "Darrick J. Wong" <djwong@kernel.org>

Enable this feature.

Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
Signed-off-by: John Garry <john.g.garry@oracle.com>
---
 fs/xfs/libxfs/xfs_format.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index b48cd75d34a6..42e1f80206ab 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -358,7 +358,8 @@ xfs_sb_has_compat_feature(
 		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
 		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
 		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
-		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
+		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT | \
+		 XFS_SB_FEAT_RO_COMPAT_FORCEALIGN)
 #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
 static inline bool
 xfs_sb_has_ro_compat_feature(
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
