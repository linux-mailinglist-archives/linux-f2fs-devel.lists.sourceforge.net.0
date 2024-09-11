Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB029748DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:44:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGu-0001vB-1C;
	Wed, 11 Sep 2024 03:43:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGr-0001uv-W0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jKRdl5s09iCG/1hRn+pGFaA9OVaf3V4M//GwCRvnKxk=; b=LgIkBPDwWn4PGH6BkUbnwK01GI
 kMHhDrUClZVHE7kKq13l77DK/tBPJTJvHWjAl5DobdTQ9W+bkb/0hWpLGn826enZVYRLdH65Xs8b3
 9qYs37HsSKLwasSfwPj7qJ3+kHozYcLLY4p1T4pCiKcPi90NzXKk2YXL7cIvbwFit42g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jKRdl5s09iCG/1hRn+pGFaA9OVaf3V4M//GwCRvnKxk=; b=VONcPdPFb75LGo0SsylWC18RnX
 XIqkAZpfEoPpKpVrDs9ij35R8Wd3u1qLc/D3lRPZvmBNau46FUNKkORGpArG1mrYKySFvnk2fozST
 JAuMSPuMTKszpXwhnNXbdXZKUCSFrp7a0lk6/kWKOYSsII513magvcetsE2QOnDGN++w=;
Received: from mail-psaapc01on2057.outbound.protection.outlook.com
 ([40.107.255.57] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGp-0000Oo-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw4WmhMPeiFj1T+l8wxPhvs8lyz7707ACyvGmKB9rROVXLNNYVcPgSJ4ecgZdUMR1XqZvPvX6EI1PYbWBogkI4MeMMzzUOmSziOYMpB0AnZ9+tcxSKZhbkP7Yyd9CLO54FJZ9ng0hJN1v0rIvBZQdqgO0CjhX/9ABckV4GH/UVXK1NKuyq6lkYBAuNJ0PI5AJTEnreqjPkSiUgme5TkIs64d3ulaiRnant6s4DDGo9dY788miQimSUwWPLD621LGufVvEaCwchgEeIjgXAimOdvrrjk9BpvnyWLRgQ4K7ERBEvcNL0EOBuQ5ucl8Yx/wROkGcz6hScaaWkXXIpGrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKRdl5s09iCG/1hRn+pGFaA9OVaf3V4M//GwCRvnKxk=;
 b=dYRomqEEXOb+yL9CUFVXbuPmgFD5DpYHE1n18w8NB611oJs4+j09vHj8rtEvPvgIo96W+G9AKlPngC7I4jYSmJE9tfWyo//4uREj4M7PPwMJECeUDdtdnL54KKj8Z2iaaZybA7+fNSeSEQJfxot70lWYZaQeKugYgdr+NCUcCT60xIUQjoHTBZsTpPn5cZZb5qiqwuBpGPGxvoeG6Yrij8XfCpRpydK4jBT4XJJ3Ot1V0pfpqxx5Hu+IAxrwkWzWQj5oDmnqv4RkNwd2ecarg/PCiCI6a9AzgI4uXAaUXtjKkHbPgAM4106ZPSZIgzUwJmW5/043zyISkXRpF8EFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKRdl5s09iCG/1hRn+pGFaA9OVaf3V4M//GwCRvnKxk=;
 b=H1LYgwkbmdMC/rrqAaE7uhiS41/JMiWS7S7McC703NH9QJTYwralwA/+OpjAqdlQKVc90W7uT1Z13rzv0bPTdyc8OGLxgqCcSep/kHVJhihlg+sutJ1LVXkJRJY6+Dv4ui4W3o7zvBIbqNmM77JITCUv2q7pC9ZvjXZAue5I5AWKr6QRhX2SEUQJnnqauxQMG2ViRGc1ZCYnZiqwozdU619051QdlvFJx70hYtmb30oEdMW1d85n23reVkZgiQPY2TgWtwR0jYMRNaua4tVNngsWZsKgORv27dpRFMy03ahjPUjQ7uw/vsCSQMOKwv01HFdxzOLlLQugbEpTC0nGCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 03:43:34 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:34 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:16 -0600
Message-Id: <395c6a887a35a5e3d396cf002914d236a288b235.1726024116.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
References: <cover.1726024116.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be6f4c3-2ca0-4b0f-5cac-08dcd213e930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QYOmjjh7mQltikBekiLtrUylK/igfWuRkJMAU8w5+IHo9QXZIj84uPed4ll3?=
 =?us-ascii?Q?AT41UpAvl6HgfD/LrP9B+Y0VNQZizNSvgl6fN3G+30xpa8uNtMxMcWS6i8ch?=
 =?us-ascii?Q?z+zCQ79Y6TGoKDLCCIG+/T+JpvxxVMiYoa7Dfp9ymrv358Va5NoTTzdO3INU?=
 =?us-ascii?Q?p0QskQKkkeDStHTP+468bzd4tufkJAnextKtuTJZve0ZHpps9VJpv5IXXVdG?=
 =?us-ascii?Q?ycGd+zQIYFgg6SlC+H6W6lUQvGUqczBUL828uxuDTW9M+aAaieCdv2z8Wh0d?=
 =?us-ascii?Q?jYyzKHez9wD3XbLFvQ/rGxrY3WyN3nevau0Xmin83ASyswOjIPTwdOiz/uR3?=
 =?us-ascii?Q?NPuhzPeBgmRvq3l1zEeLTGZtpANWQfgCnEUBG/24dx/NGAQSB22lxbngdZ+f?=
 =?us-ascii?Q?9CuV6WLLoltZrgpJ1rQ9DbhVhxC7pr4zDtVe1/1loNrKUpHChqXJ/+NCcFOE?=
 =?us-ascii?Q?erSY2UfYLLRrnru9CpH2k4LARCSL8dDVMcYw5EO/OxbUNtU2ZOhHF5ig2NSd?=
 =?us-ascii?Q?/9HBXvKKa5hIYfOdUtbZpR/2Q20EhBuDIMD/vQYlgVeIjTRP5WLwUnHEp1/i?=
 =?us-ascii?Q?i7r/vZEGakHc8mLZzuDvsbDvGAJmm7gImOyQH6nS+9RnuQcPFkIejEg+rubW?=
 =?us-ascii?Q?n1pXtpvcvJ3e7q/DMapJRBHZYBYjKS36mdbUDl6UxQmD/KhNTFB8F7JaNUAR?=
 =?us-ascii?Q?FBUPXVd/M2Q1J9BO2Aao4fPeHhwxWlfDs4IGlQerSgqBFOYCQ/glhztMKi/f?=
 =?us-ascii?Q?0qu53MtjIpgF0yl53qq3D08hn5dsHOQI7k6cek4fH+GuV6TCu+W7EZkR6k6U?=
 =?us-ascii?Q?e+OLhkEnvEG53LVDPxsKxtXy0QnorEapxBsK6tofw5Hs3xLvyPFbQMsYvKBc?=
 =?us-ascii?Q?SITv0RQqasxQjRAia2QmUPnbWLFQcRSlDABEYDMy2gtgzBIY8RlJoEACgRGq?=
 =?us-ascii?Q?3Dlb5V0bmY3dBEd7oGLrnw7+PlTaQ7jH1QA+++KVr3i/v4xnHcLvvSnWyE/g?=
 =?us-ascii?Q?ZG5KGjElWCls73NYTs3+mTLOPjG4FfHN9hPupWQazCPbcLFnD1ysJJoykRal?=
 =?us-ascii?Q?861zlHgkWQrDz3q8ApbLMuSDUFukbf057lMoxI1dYVq67nnsDoOYUmEBj4uP?=
 =?us-ascii?Q?Hk3gfBRMXTqV/A44u9HMt616crZDbmbEnuo72B08pPeGH+1xvLXU4KQAF4aj?=
 =?us-ascii?Q?ajdAt8yo63P5mDDr0ksfDRqu3ikc6FDWz3+1FSHANsxgaA6G70d7g1aCcvyc?=
 =?us-ascii?Q?TraMPR/uCwRjRKrkD3idPcEIwuatrKU54mNVXwdM9jwdzprcCoUw2/25XULD?=
 =?us-ascii?Q?09Q2WrWkwFTBS236nanEwyUj/2yJ9mNu2FC2qoaoDTv1zpjwzYqQxuTHEzUQ?=
 =?us-ascii?Q?nx8WLdpopnIAF0YJpsZK7X37ODpQc+EV9POe30KEgXbVsGISmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y37IUIzDGR9ofzg6GOtfvgbVDpJYEL8L3ALVR0z+/iuJ57v+2Yle61Spuflv?=
 =?us-ascii?Q?rZWbxkg4lDs55Q4e7tG+nUeUbQCr5yquprGclP0NMRJU3qarhbmmOallIMtc?=
 =?us-ascii?Q?XJkaxzUo/Fn9RQAXQ++3LnATq0aNHfG2HPCBnCuydvpGRxfFjbC1nJk62ueq?=
 =?us-ascii?Q?YjhKqpn7NF+rN+wHGVxRH7y/sG79DI0rYjX01AqFrWQFNj38rYieHKQu8ar0?=
 =?us-ascii?Q?6LiIkI0K8ZV4uAtxytzFIpcsxh0Utz3XZL8ZjcT2gzwX/X8dQRbEA0QuQzuZ?=
 =?us-ascii?Q?u2lmpTOlRn+4ajxXrUYyNsJk419DXCegotIQovDYFf0Nhpow0gh7ay+FjqSN?=
 =?us-ascii?Q?aCyPca8wiksC0TCo/IU/C8cRQSwx55oD+3JpXRDS4ceaG6iY/rsNJ6r4YoMO?=
 =?us-ascii?Q?+csyIkdn+ZJIsFPluPCwyb3Gx+5RLTSw5qNwyioW4wCb5JxkDO83TITFKtpv?=
 =?us-ascii?Q?KngcgAtJa53wA1fpCes7ltTEutgsMeXcGj0CBJJhIam52311mQq+aSRQkHIQ?=
 =?us-ascii?Q?BYEBK6J3wYnnxVYCXHsHy0VfENgmynr/tPWYjLs1NHujVFVnCpYXYMNSfxPa?=
 =?us-ascii?Q?ELGZqaTm6wNVCTF6SUutj8qO3zJrSF9YPzhIIpROfIwGGoNKuc79E2BZUrR3?=
 =?us-ascii?Q?HLabX1XfPqB/KHMrl28ascHdkyJr1YAaLMx6PtPpGopj+l6/Ytx0pMQp5o1X?=
 =?us-ascii?Q?aCkZwTshJDqs2VJRmvFiEXxZkQsW68ZWcb+ShYb4p8dm1UVOfqy0JkE34uPK?=
 =?us-ascii?Q?4irfcseNgJN0WRyAoO9jrSodO8Q37NGFxW/bqz8quNWJ2ehmTQaC/vzLmfNd?=
 =?us-ascii?Q?RD0sPEHOhYgpgclSShQz4bkj6p8cv8eQ+jqG435xscS7c+zKi3RLoEiuEAPD?=
 =?us-ascii?Q?j27KFaetRGf3jq5pl1FJMFixvj1dysK5H9jCnVJYFwg1Z6U0vIc5nCmlVx9s?=
 =?us-ascii?Q?c+1p6aCg7V3v3q2qs8BkxTNHvQr2Pme5OfDwMpYVwS5wW4iiXSK3nsvX9k0O?=
 =?us-ascii?Q?8PscpKFs/wcnCOP2FYYP5K1DXM2xwjnVEKbY+eH9n/NG7W5/txEQIuJ+Eq/x?=
 =?us-ascii?Q?rELDrDGAdT5+gfEYqlhZDTfSqJI4aUjKWTKougtX73x4TrZsa4jK1QeRH8Gj?=
 =?us-ascii?Q?NZ8cplT/0w2uk+8oxGznPCvOtNU6Na/agex/qnWcb0T+XN0x4NfNupSBBESh?=
 =?us-ascii?Q?NKkntuZipAu62mmEy9zN2aykOBqwG497IVqPc6TjBQW8jBRX4ZbraCR14oEZ?=
 =?us-ascii?Q?2jBQ3kW9G3M/8hD0BPIAdrxgp+Ys1YdlaaoSifBAaPLH3wLuPY2nelxsI/Mq?=
 =?us-ascii?Q?/LoebZ8NIsQSU4qvH7/NB0nlXY0qO+hqe8FIkwPelCfve6aHY0+/tHFNKnx3?=
 =?us-ascii?Q?6u5QdwQh1no/7/ojv+DPXRmVDuqVSRx1cvHG7GQ1ByymNynTl4J1lherZ7WU?=
 =?us-ascii?Q?gqwmv6ErGl14E9FMz0Qy6NwnyPaR6ykayAnH9UTaDKFChp40IGRScWco/HIi?=
 =?us-ascii?Q?u4+tpQrVU7lsJc1N932gfMYuQ3ABcR1j5CZc3A4QJqzREl6RoTUd/VJGWL/e?=
 =?us-ascii?Q?/FWmITe9mDICdWNeYkoPGRMD4JM56uvX/IOOSaFU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be6f4c3-2ca0-4b0f-5cac-08dcd213e930
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:33.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQ4e91PTOd4d47pVyRYUp6OyXXL9rBaCADzNgdDrEMvPlYjTFixw+c/JhGdFWCCl+5Am3MK8dRH+eRp53YjvTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs inline data is a special case of inline tail, we can
 expand inline tail based on inline data. If file tail can inline to inode
 block, not bother to pre-allocate block at write begin. When tail page writing
 back, inline it or normally write it if the tail is oversize. And when inode
 page writin [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.57 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.57 listed in list.dnswl.org]
X-Headers-End: 1soEGp-0000Oo-Fr
Subject: [f2fs-dev] [PATCH v2 03/13] f2fs: implement inline tail write &
 truncate
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As f2fs inline data is a special case of inline tail, we can expand
inline tail based on inline data.

If file tail can inline to inode block, not bother to pre-allocate block
at write begin. When tail page writing back, inline it or normally write
it if the tail is oversize.
And when inode page writing back, update inline data from tail page.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   | 30 ++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h   | 16 ++++++++++++++++
 fs/f2fs/file.c   | 10 ++++++++++
 fs/f2fs/inline.c | 38 +++++++++++++++++++++++++++++++-------
 fs/f2fs/node.c   |  6 +++++-
 5 files changed, 92 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6457e5bca9c9..cd13b5703228 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2776,6 +2776,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	loff_t psize = (loff_t)(page->index + 1) << PAGE_SHIFT;
 	unsigned offset = 0;
 	bool need_balance_fs = false;
+	bool need_clear_tail = false;
 	bool quota_inode = IS_NOQUOTA(inode);
 	int err = 0;
 	struct f2fs_io_info fio = {
@@ -2867,6 +2868,16 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 			goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode) && page->index == end_index) {
+		if (support_tail_inline(inode, i_size)) {
+			err = f2fs_write_inline_data(inode, page);
+			if (!err)
+				goto out;
+		} else {
+			need_clear_tail = true;
+		}
+	}
+
 	if (err == -EAGAIN) {
 		err = f2fs_do_write_data_page(&fio);
 		if (err == -EAGAIN) {
@@ -2889,6 +2900,11 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	if (err && err != -ENOENT)
 		goto redirty_out;
 
+	if (need_clear_tail) {
+		err = f2fs_clear_inline_tail(inode, false);
+		if (err)
+			goto redirty_out;
+	}
 out:
 	inode_dec_dirty_pages(inode);
 	if (err) {
@@ -3393,6 +3409,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			flag = F2FS_GET_BLOCK_DEFAULT;
 		f2fs_map_lock(sbi, flag);
 		locked = true;
+	} else if (f2fs_has_inline_tail(inode)) {
+		if (!support_tail_inline(inode, pos + len)) {
+			f2fs_map_lock(sbi, flag);
+			locked = true;
+		}
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
 		f2fs_map_lock(sbi, flag);
 		locked = true;
@@ -3421,6 +3442,15 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode)) {
+		if (support_tail_inline(inode, pos + len)) {
+			f2fs_do_read_inline_data(page_folio(page), ipage);
+			if (inode->i_nlink)
+				set_page_private_inline(ipage);
+			goto out;
+		}
+	}
+
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
 		if (locked) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e02a6619b90a..2e0530b55e74 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3322,6 +3322,21 @@ static inline int f2fs_has_inline_dentry(struct inode *inode)
 	return is_inode_flag_set(inode, FI_INLINE_DENTRY);
 }
 
+static inline bool support_tail_inline(struct inode *inode, loff_t i_size)
+{
+	const pgoff_t tail_index = ((unsigned long long)i_size) >> PAGE_SHIFT;
+	unsigned long tail_len = i_size & (PAGE_SIZE - 1);
+
+	if (tail_index > COMPACT_ADDRS_PER_INODE)
+		return false;
+	if (!tail_len)
+		return false;
+	if (tail_len > MAX_INLINE_DATA(inode))
+		return false;
+
+	return true;
+}
+
 static inline int is_file(struct inode *inode, int type)
 {
 	return F2FS_I(inode)->i_advise & type;
@@ -4197,6 +4212,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
 int f2fs_convert_inline_inode(struct inode *inode);
+int f2fs_clear_inline_tail(struct inode *inode, bool force);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
 int f2fs_write_inline_data(struct inode *inode, struct page *page);
 int f2fs_recover_inline_data(struct inode *inode, struct page *npage);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 168f08507004..957d1ff55350 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -748,6 +748,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode) && f2fs_exist_data(inode))
+		f2fs_truncate_inline_inode(inode, ipage, 0);
+
 	set_new_dnode(&dn, inode, ipage, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, free_from, LOOKUP_NODE_RA);
 	if (err) {
@@ -4703,6 +4706,13 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 			return ret;
 	}
 
+	if (f2fs_has_inline_tail(inode) &&
+			(pos + count > MAX_INLINE_TAIL(inode))) {
+		ret = f2fs_clear_inline_tail(inode, true);
+		if (ret)
+			return ret;
+	}
+
 	/* Do not preallocate blocks that will be written partially in 4KB. */
 	map.m_lblk = F2FS_BLK_ALIGN(pos);
 	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index cca7d448e55c..2e63e9389fd7 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -102,6 +102,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 {
 	void *addr;
 
+	from = from & (PAGE_SIZE - 1);
 	if (from >= MAX_INLINE_DATA(inode))
 		return;
 
@@ -156,11 +157,12 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 	};
 	struct node_info ni;
 	int dirty, err;
+	pgoff_t index = page->index;
 
 	if (!f2fs_exist_data(dn->inode))
 		goto clear_out;
 
-	err = f2fs_reserve_block(dn, 0);
+	err = f2fs_reserve_block(dn, index);
 	if (err)
 		return err;
 
@@ -176,8 +178,8 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 	if (unlikely(dn->data_blkaddr != NEW_ADDR)) {
 		f2fs_put_dnode(dn);
 		set_sbi_flag(fio.sbi, SBI_NEED_FSCK);
-		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
-			  __func__, dn->inode->i_ino, dn->data_blkaddr);
+		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[%lu]:0x%x, run fsck to fix.",
+			  __func__, dn->inode->i_ino, index, dn->data_blkaddr);
 		f2fs_handle_error(fio.sbi, ERROR_INVALID_BLKADDR);
 		return -EFSCORRUPTED;
 	}
@@ -210,10 +212,33 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 clear_out:
 	stat_dec_inline_inode(dn->inode);
 	clear_inode_flag(dn->inode, FI_INLINE_DATA);
+	if (index >= COMPACT_ADDRS_PER_INODE)
+		clear_inode_flag(dn->inode, FI_INLINE_TAIL);
 	f2fs_put_dnode(dn);
 	return 0;
 }
 
+int f2fs_clear_inline_tail(struct inode *inode, bool force)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct page *ipage;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
+
+	f2fs_truncate_inline_inode(inode, ipage, 0);
+	clear_page_private_inline(ipage);
+
+	if (force || end_index >= COMPACT_ADDRS_PER_INODE)
+		clear_inode_flag(inode, FI_INLINE_TAIL);
+
+	f2fs_put_page(ipage, 1);
+	return 0;
+}
+
 int f2fs_convert_inline_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -263,20 +288,19 @@ int f2fs_convert_inline_inode(struct inode *inode)
 int f2fs_write_inline_data(struct inode *inode, struct page *page)
 {
 	struct dnode_of_data dn;
+	pgoff_t index = page->index;
 	int err;
 
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
-	err = f2fs_get_dnode_of_data(&dn, 0, LOOKUP_NODE);
+	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
 	if (err)
 		return err;
 
-	if (!f2fs_has_inline_data(inode)) {
+	if (!f2fs_has_inline_data(inode) && !f2fs_has_inline_tail(inode)) {
 		f2fs_put_dnode(&dn);
 		return -EAGAIN;
 	}
 
-	f2fs_bug_on(F2FS_I_SB(inode), page->index);
-
 	f2fs_wait_on_page_writeback(dn.inode_page, NODE, true, true);
 	memcpy_from_page(inline_data_addr(inode, dn.inode_page),
 			 page, 0, MAX_INLINE_DATA(inode));
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b72ef96f7e33..5c45de7f60a1 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1514,6 +1514,8 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	struct inode *inode;
 	struct page *page;
+	loff_t i_size;
+	pgoff_t end_index;
 	int ret;
 
 	/* should flush inline_data before evict_inode */
@@ -1521,7 +1523,9 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 	if (!inode)
 		return;
 
-	page = f2fs_pagecache_get_page(inode->i_mapping, 0,
+	i_size = i_size_read(inode);
+	end_index = i_size >> PAGE_SHIFT;
+	page = f2fs_pagecache_get_page(inode->i_mapping, end_index,
 					FGP_LOCK|FGP_NOWAIT, 0);
 	if (!page)
 		goto iput_out;
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
