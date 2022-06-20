Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A3550F2B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jun 2022 06:09:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o38ib-0007Rl-R9; Mon, 20 Jun 2022 04:08:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ben.chang@sonicsky.net>) id 1o38ia-0007Re-Nj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 04:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S1D4azl5sIJOLmTx2E17vURKOn4c0TPFIVeexmLPUwU=; b=fXz7qUqk1yvtetyFeqAH+nrSXu
 t1s0DcMTYThX/lwHFXHP91ZD4t/aqeAxnEDLof6J3Qb++/ieFRx6VDi/L3WyhjhDP9Ti5d9q7+T1a
 i4WkouzqxPX7xD8QNqbNr7KZsZB7Vg9pPIGKxJD/EjV/ohte4PhCyqgNNtClELH10glM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S1D4azl5sIJOLmTx2E17vURKOn4c0TPFIVeexmLPUwU=; b=i
 597qJiAN6wvdKmfbYBLUEYs1FUojie6VMnU/0G57qVJQm8Ga2c4XxwxsUnyWIndje5CipEZbWcNIj
 m+pXgEHuD0J9c6biT5FRDwuojWBEqOkq17uOGH0KYZdIf2eyoylUeVAr9e/nso7SWFsBFjOVjcesE
 pw3hnGvIEC1YpTqk=;
Received: from mail-tyzapc01on2068.outbound.protection.outlook.com
 ([40.107.117.68] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o38iY-007r1j-80
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 04:08:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nz8lO9jTgNirSA+/am9jlCZGkpP8IdRFq4QHB5uDy1TrEINA55cM62a2O0bJD+HLGdR8XdrsmDUO7vPR1Ja1t1dupqrhVxTng87Fx0ZzqgGiV1Xys3kfws1asoPgN5Ggj6/kZPp5pGEt0PAel8P4zdrfO/C39mZNBFM5qdPWiWj0tbRNhL/DXaymaNI1j57PNF4aJmJwtBl4vcVt+XKVdsuee7P9WUsdPPFBqEIi9MVJw20aPIqQpRtE8bN1LCbSI7+1jo5Fwhhn0tOtvCt4lpl67KEEzV7gssKUj5LpmXe7Yjd0eZnifDxyczDpzK8sZu7Bpqmzd6suPXtLkh53IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1D4azl5sIJOLmTx2E17vURKOn4c0TPFIVeexmLPUwU=;
 b=gAggdapthT9Z0VVoyFLVeGCnIvPdfWiffba3Z4njp0MFTs7fsp1oVg4/U/ExTJYKTqPpPv3hPF6NDL6Rc0RwmSguFbv4v0HziCRroOo2vNCBp2WsBw1O5ufwvKfnziJ/DTzdLiqLJpD5ogNZcM1d4tYl/swjWFg2viRksPf2i6dr4tBvUFH/frdOUrfw4bySeorqAI3kEgnbZNGjfleo7iUUjC+xfjo0t5zlgc+3sY7fCgTmUfw+kuZZMqFv4tE5M2tFXchdXXLgOwcZmbNNkL4ses54+0WiyXh5lCCqTWXRGpNoqBrilghlaoNl4P3z7LxqvS+D4izBh1sH9pEzOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sonicsky.net; dmarc=pass action=none header.from=sonicsky.net;
 dkim=pass header.d=sonicsky.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sonicsky.onmicrosoft.com; s=selector1-sonicsky-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1D4azl5sIJOLmTx2E17vURKOn4c0TPFIVeexmLPUwU=;
 b=2hfUQokiL1cmVbnMzGrLaVfXz41EY6Vz9u5MkJYRUeCop1R1h98QrsAr4IXK09CkUQyCnqAASOEyQbPwYPZLcHypC8uK8hjYZMeKy0v/UeUSXzVDHGzheer0AwrlHJSH3DFd94xnSH1VrGN5hPDGCRKQB/1xWqr+oHJgC792Tj+M522bfulw5pBNquPyUyb+U9c0bUlJpmDLLRm3Wm2fgQOiaP+FmzCgeUTOp/ZSOd0TFmn/BMmXrOSj5/iBENKKkwcfQxWK73ctMCFmeKAHOlJZ8q0vmBTDhyPz4wE0fcm3W8TqoPQ4YG72HVVrY//x61M5so1HNBBfQxB/6AJmaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sonicsky.net;
Received: from TY2PR06MB3294.apcprd06.prod.outlook.com (2603:1096:404:106::18)
 by SI2PR06MB5292.apcprd06.prod.outlook.com (2603:1096:4:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 03:53:10 +0000
Received: from TY2PR06MB3294.apcprd06.prod.outlook.com
 ([fe80::edcf:f10f:38c2:8779]) by TY2PR06MB3294.apcprd06.prod.outlook.com
 ([fe80::edcf:f10f:38c2:8779%6]) with mapi id 15.20.5332.019; Mon, 20 Jun 2022
 03:53:10 +0000
From: Ben Chang <ben.chang@sonicsky.net>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 20 Jun 2022 11:53:01 +0800
Message-Id: <20220620035301.63951-1-ben.chang@sonicsky.net>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: TYBP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::18) To TY2PR06MB3294.apcprd06.prod.outlook.com
 (2603:1096:404:106::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30714e7c-bea2-4107-0438-08da5270643a
X-MS-TrafficTypeDiagnostic: SI2PR06MB5292:EE_
X-Microsoft-Antispam-PRVS: <SI2PR06MB5292F9B2800314DA7CACAA9C96B09@SI2PR06MB5292.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r41BdchhL4gxEGOwpLb7BoWgQguyb6hs6zwEFkMXQHOby/Crjoag1/2w/irfq8u2G9rjiNj5/GROPpwzMZd3Dl4u/lNkFNHuO2n15aDM3ASEcEopGUreN2vG3H99kFVzT3LfRLeGNN8BODV3hrDjDf5fQuC0rdTiFcFagSgPQDRkMMqbmSpJsrnfKuRRYQAIiFlKcOMF18wg+tFTgzRGL8e4LAQLTQgOhGaOXhJY5vzjWxGshAUlSEyydBCRWbS5sFcElfy9V3OXuwVsQcc86M2W/Z7ulqX8jfOHuijn0HvrXjZzFRISLlAXVT/PBMFQBgZf1bQmD45UGpISQEYdGzKu95UZtcN9Ee+fn8vE2oA5mXJq1HszglQMaousZvTGFDimEe0BXUWX6s5oZ/RyiYZkGt/dKlFkjtXNxLBSsCsD7YQKFmy1uM4dYXhUt7QggZGr41DyYwqzSDUnCh51fBRQMktdVhoUAAAK6ifHKLmLMYGZQfNrtbwdk+aJGUPnpUE/KxNrfMAEOiHPRf43wW9u7VnANeCbPyDNb89kMHNkHXi5SSHG1q6AeAD0+IGz4a4bJgEXWMt3s8YvQb9hrCatObedUCsWZbTWfhh06u62CtYkxIen7VQd3CpDpDm2uwhmX7czr7huSwI2s6wrx2uquVp0H+SozNcevoT2SdV2ULxHMutRtBDfhgJldm1C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3294.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39840400004)(136003)(346002)(6486002)(26005)(6506007)(83380400001)(38100700002)(36756003)(44832011)(6666004)(1076003)(186003)(41300700001)(107886003)(52116002)(508600001)(2616005)(6512007)(66476007)(66946007)(2906002)(66556008)(8936002)(4326008)(5660300002)(38350700002)(86362001)(8676002)(6916009)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pJQiaaPhn5Qb79NKQCw78Y5ClZyfStFxmj/MknFwksrydXR/9pOVfr1tbaEQ?=
 =?us-ascii?Q?HnNezED/JnzurxRQvYQnuafTstoY/oawK3F6P0CKhnSSfSX8VNXO5gPjmxvr?=
 =?us-ascii?Q?8g879lbkqX9fPnsSKpMtAIyOSPR7xkpXcoz6n4c1ZdBb529I2hxt5m5KGKdD?=
 =?us-ascii?Q?St0pR1i1eHvlCvTw177Xl//fiLDUhgyO2SaCk83k13DpHykjt4RXgA2Wqn6R?=
 =?us-ascii?Q?I9TMDvmftVU2BRYE3giXdzqS2JcHiyPA6VlKbzSK6VU6SXvhAMnRjRI6gpdQ?=
 =?us-ascii?Q?javgvLEn8AW3MZsQSvtsIfRgfbGiqO+17c7VAGMt/uPnjR+Hs8+baq6UgC3r?=
 =?us-ascii?Q?bV6zc3rG8Ebq2VbYkedTBTkrOsuny6srthlMdcv6h+vjusvuBt9DN7G9R3HH?=
 =?us-ascii?Q?y+6hUr8yzntZzziyLbrtiKI4bFian+p7bFDC/JBC59na6PXAiOQ6e2JaFqsH?=
 =?us-ascii?Q?a1mr25cGlmHdP76kJI4fAmVAGSWlt9iIdhhYwbU2raJ/p7ZZDGTYjhhgx15i?=
 =?us-ascii?Q?fS1Lfr5Lk+SJMAg6pAaNQ+wIA6Z3HUyZQEU0hClvm0cJWgBU/XaAaLhktMpt?=
 =?us-ascii?Q?rMB2OvpUSnE/BVRCn5dywqerTEvnSbH/9jiKmgR1+LcGU76MZ+djUfvUj+DG?=
 =?us-ascii?Q?oFyL0dxPSOCmvtH3qKvlqpCU/ycbAbWfr8m8bjYZ49CkbeH1OmfyujVnFcEC?=
 =?us-ascii?Q?3KFb5gjYXl4r+908QU5IH25aIsn4FJ5nJMP4rhW/J+yEZaAig/PjzmHmn9On?=
 =?us-ascii?Q?+one1Td6uhaepBysH+bKVINgTC+3b2LANdVSrkpChvUu4HlCrRShgY877NSM?=
 =?us-ascii?Q?jW/csBBGk6oPWKKWy1yhmUTV08Muq+cCqmYMOw+f9dGmIQwfsg4s9KHlkNMM?=
 =?us-ascii?Q?cypCftGApLN6kQ9cKJ/+F2sHrGQvmhT8iMXKZGU6/NTrN9g+75BS0cvivJmq?=
 =?us-ascii?Q?BzI//lGHgwczNdxZLEXeXZpe9vpe3WOYIrtf5d4HLyAe8YW2p0JJ0J1U3Q+W?=
 =?us-ascii?Q?b1emuhSclRMcyv9qrvXUhAs9BxQfuBCT3Jv36Vh17yaMAC4CGC4G8U4e/yiA?=
 =?us-ascii?Q?Gsc2eQqSmfEht6NJMSB3mNlSD6STLfP7QLAMOKmyn4VsWu04ucSDdySCxA48?=
 =?us-ascii?Q?DdKShPbyRyfI5k5L5tjN+cdCezBV4txzZtjQhUIDa+z2jwH5FphaxFM30UJr?=
 =?us-ascii?Q?zN+nQRbGT1/G3yjt8KVTSz5P0oZur6jFk9xqKpEAuDzgML1H7phta4IgPKIS?=
 =?us-ascii?Q?ZvHMqHLx8sUGnYNcBRzIAUpCTT1AOkA9We8eyF/ZrXBOqoAaSfXHaFnkh209?=
 =?us-ascii?Q?5fME7S2QaNI+iK/uiWYqaQIdzgrKD241KJK6UztIGPG6QlWrHFLIqqTnUgw4?=
 =?us-ascii?Q?o7EVJnUX7fq+aRQ7lFHm1YETfguMPPsXiYqZ7OfOOtomLlO/rtX5S09Wm8Mv?=
 =?us-ascii?Q?7qSb6+3+amFx/Dfe4rUktN7X3EB/n6Zglt2zOf5k+ar8iy9RTD4uNJPVcuOA?=
 =?us-ascii?Q?I7aGnc/jXN5uZG7GsDqEWuqh9pVucvEt7f7gEuzAbghgjSBjtApMZKeb6dGW?=
 =?us-ascii?Q?WNzWV2CO+iTqjF3R2zG2mM/3xoTtkUQDOXa38WGfqjtSUZbFkv+6YWaf9nTf?=
 =?us-ascii?Q?leP0q8ChIcVW6uMmVqHxN7sS/Q0GMqCoSPKjEfFVuXVNEify06N593R/Gsz8?=
 =?us-ascii?Q?iXUMDaFz3lrArvWv10wbK5E4Y1PjxG715skYiZBAcQcT5Io3oXP/ygMkU8UW?=
 =?us-ascii?Q?1d7rYWLJOa7hJEa5JS08XvuCUzEcy3k=3D?=
X-OriginatorOrg: sonicsky.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 30714e7c-bea2-4107-0438-08da5270643a
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3294.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 03:53:10.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87bb529d-40c8-4a61-bd69-bd7eb99dd916
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRW18QPgFp7AlivsWSydTM8b6i8kDSDGnK0Y9faVKlpLFuAMrYhWHy/dbWGtxoOA64wRWr1wDf9goIvtSiDM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5292
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some device like android phone doesn't show the dev number
 path in /dev/block/, for example: $ ls /dev/block/ bootdevice dm-6 loop24
 loop43 ram13 sda5 sdd4 sde24 sde43 sde62 sdf1 by-name dm-7 loop25 loop44
 ram14 sda6 sdd5 sde25 sde44 sde63 sdf10 dm-0 dm-8 loop26 loop45 ram15 sda7
 sdd6 sde26 s [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o38iY-007r1j-80
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix cannot get bdev information
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
Cc: Ben Chang <ben.chang@sonicsky.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some device like android phone doesn't show the dev number path in
/dev/block/, for example:

$ ls /dev/block/
bootdevice  dm-6    loop24  loop43    ram13  sda5  sdd4   sde24  sde43  sde62  sdf1
by-name     dm-7    loop25  loop44    ram14  sda6  sdd5   sde25  sde44  sde63  sdf10
dm-0        dm-8    loop26  loop45    ram15  sda7  sdd6   sde26  sde45  sde64  sdf11
dm-1        dm-9    loop27  loop46    ram2   sda8  sdd7   sde27  sde46  sde65  sdf12
dm-10       loop0   loop28  loop47    ram3   sda9  sde    sde28  sde47  sde66  sdf13
dm-11       loop1   loop29  loop48    ram4   sdb   sde1   sde29  sde48  sde67  sdf14
dm-12       loop10  loop3   loop49    ram5   sdb1  sde10  sde3   sde49  sde68  sdf15
dm-13       loop11  loop30  loop5     ram6   sdb2  sde11  sde30  sde5   sde69  sdf16
dm-14       loop12  loop31  loop50    ram7   sdb3  sde12  sde31  sde50  sde7   sdf17
dm-15       loop13  loop32  loop51    ram8   sdb4  sde13  sde32  sde51  sde70  sdf18
dm-16       loop14  loop33  loop6     ram9   sdb5  sde14  sde33  sde52  sde71  sdf19
dm-17       loop15  loop34  loop7     sda    sdc   sde15  sde34  sde53  sde72  sdf2
dm-18       loop16  loop35  loop8     sda1   sdc1  sde16  sde35  sde54  sde73  sdf3
dm-19       loop17  loop36  loop9     sda10  sdc2  sde17  sde36  sde55  sde74  sdf4
dm-2        loop18  loop37  mapper    sda11  sdc3  sde18  sde37  sde56  sde75  sdf5
dm-20       loop19  loop38  platform  sda12  sdc4  sde19  sde38  sde57  sde76  sdf6
dm-21       loop2   loop39  ram0      sda13  sdc5  sde2   sde39  sde58  sde77  sdf7
dm-3        loop20  loop4   ram1      sda14  sdd   sde20  sde4   sde59  sde78  sdf8
dm-4        loop21  loop40  ram10     sda2   sdd1  sde21  sde40  sde6   sde8   sdf9
dm-5        loop22  loop41  ram11     sda3   sdd2  sde22  sde41  sde60  sde9   vold
dm-53       loop23  loop42  ram12     sda4   sdd3  sde23  sde42  sde61  sdf    zram0

this will cause stat_bdev cannot show bdev information.

But most of devices (include android) show dev number path in /sys/dev/block, for example:

$ ls  /sys/dev/block
1:0    254:1   254:6   259:21  259:38  259:54  7:104  7:24   7:368  8:11  8:4   8:70  8:87
1:1    254:10  254:7   259:22  259:39  259:55  7:112  7:240  7:376  8:12  8:48  8:71  8:88
1:10   254:11  254:8   259:23  259:4   259:56  7:120  7:248  7:384  8:13  8:49  8:72  8:89
1:11   254:12  254:9   259:24  259:40  259:57  7:128  7:256  7:392  8:14  8:5   8:73  8:9
1:12   254:13  259:0   259:25  259:41  259:58  7:136  7:264  7:40   8:16  8:50  8:74  8:90
1:13   254:14  259:1   259:26  259:42  259:59  7:144  7:272  7:400  8:17  8:51  8:75  8:91
1:14   254:15  259:10  259:27  259:43  259:6   7:152  7:280  7:408  8:18  8:52  8:76  8:92
1:15   254:16  259:11  259:28  259:44  259:60  7:16   7:288  7:48   8:19  8:53  8:77  8:93
1:2    254:17  259:12  259:29  259:45  259:61  7:160  7:296  7:56   8:2   8:54  8:78  8:94
1:3    254:18  259:13  259:3   259:46  259:62  7:168  7:304  7:64   8:20  8:55  8:79  8:95
1:4    254:19  259:14  259:30  259:47  259:63  7:176  7:312  7:72   8:21  8:6   8:8
1:5    254:2   259:15  259:31  259:48  259:64  7:184  7:32   7:8    8:3   8:64  8:80
1:6    254:20  259:16  259:32  259:49  259:65  7:192  7:320  7:80   8:32  8:65  8:81
1:7    254:21  259:17  259:33  259:5   259:66  7:200  7:328  7:88   8:33  8:66  8:82
1:8    254:3   259:18  259:34  259:50  259:7   7:208  7:336  7:96   8:34  8:67  8:83
1:9    254:4   259:19  259:35  259:51  259:8   7:216  7:344  8:0    8:35  8:68  8:84
253:0  254:5   259:2   259:36  259:52  259:9   7:224  7:352  8:1    8:36  8:69  8:85
254:0  254:53  259:20  259:37  259:53  7:0     7:232  7:360  8:10   8:37  8:7   8:86

so change the access path from /dev/block to /sys/dev/block
(same method of libudev)

Before:

$./f2fs.fibmap testfile_4k

----------------file info-------------------
testfile_4k :
--------------------------------------------
dev       [254:53]
ino       [0x    3dda : 15834]
mode      [0x    81b6 : 33206]
nlink     [0x       1 : 1]
uid       [0x       0 : 0]
gid       [0x       0 : 0]
size      [0x   40000 : 262144]
blksize   [0x    1000 : 4096]
blocks    [0x     200 : 512]
--------------------------------------------

file_pos   start_blk     end_blk        blks
       0     2256926     2256987          62
  253952     2150337     2150338           2

Patched:
$./f2fs.fibmap testfile_4k
----------------bdev info-------------------
devname = 254:53
start_lba = 0

----------------file info-------------------
testfile_4k :
--------------------------------------------
dev       [254:53]
ino       [0x    3dda : 15834]
mode      [0x    81b6 : 33206]
nlink     [0x       1 : 1]
uid       [0x       0 : 0]
gid       [0x       0 : 0]
size      [0x   40000 : 262144]
blksize   [0x    1000 : 4096]
blocks    [0x     200 : 512]
--------------------------------------------

file_pos   start_blk     end_blk        blks
       0     2256926     2256987          62
  253952     2150337     2150338           2

Signed-off-by: Ben Chang <ben.chang@sonicsky.net>
---
 tools/fibmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/fibmap.c b/tools/fibmap.c
index 3238f29..9f94b53 100644
--- a/tools/fibmap.c
+++ b/tools/fibmap.c
@@ -102,7 +102,7 @@ static void stat_bdev(struct stat *st, unsigned int *start_lba)
 	char linkname[32] = { 0, };
 	int fd;
 
-	sprintf(devname, "/dev/block/%d:%d", major(st->st_dev), minor(st->st_dev));
+	sprintf(devname, "/sys/dev/block/%d:%d", major(st->st_dev), minor(st->st_dev));
 
 	fd = open(devname, O_RDONLY);
 	if (fd < 0)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
