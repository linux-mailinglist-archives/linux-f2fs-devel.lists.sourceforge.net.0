Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1244969762
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:40:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slP5h-0006uR-1V;
	Tue, 03 Sep 2024 08:40:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slP5f-0006uI-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NNF+24GmbE1v/d2YYMPCNo5gUVFMWsu5+kDuhFQOMxQ=; b=YQRR0IbksnyGZaBMaJ6uyy8Tox
 vf/AaMkaKOHDT0OmAIwKbpifEuu4YhZRmXSkYKpwEC7TbricE7eJD5Qe4ruUO8zSt/ryaaWpAMaTb
 Ung8qutOBPrXGn2OkezLqm2N8Amf4oIDPdj1h2kIwxXLzww3FDlUeJ2qxt98FjXHWie4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NNF+24GmbE1v/d2YYMPCNo5gUVFMWsu5+kDuhFQOMxQ=; b=d
 OwwFqF8fAIYKCqBa52q57HikZBZP3ou78iEMWUYD29hEnhERYv4xjLHnvDoeMRf7JlU3ZElW/5bv4
 u5xBpbw08jc/LnW/Zx+jEbJOf5iZXdgfLn35EOXFCg2ILQHqMXa+D4VLWvCi6rQCS2KXSCjqtuKXA
 4pAiBmyJmliTrkMo=;
Received: from mail-sgaapc01on2062.outbound.protection.outlook.com
 ([40.107.215.62] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slP5d-0008U3-UY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjM/+qWYxSwxwrxowuWNiPKWTf7zogKkVoNDoYJwHXs65/rwidziB7EXsmdcsmoRaCCCuqt4HjL2KKjGox2j1+Q/7oqUD1j/y4nl4HZ+qTioTCnHNO0PcYZqn+udF1MsWhiHDUOv3ImoidHPvy2qovB94J3xaxO/qU50ffoHLad5EGODwCwJisV2CwiLq80/yzFl8vpVdHXSNj4uUOk+I+dcKOMDEK6Pmg8mSzJxYOG9goFMWV4LvhOhe3AiAJ4lh9k9fmvJXfvVj23ILkNphOVr6vDxwTeV0Zt6anBQHQbeiZe8dho+WRoWxI626mfh1FJ3MTOdusd8QR4M2O8toQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNF+24GmbE1v/d2YYMPCNo5gUVFMWsu5+kDuhFQOMxQ=;
 b=gz3HVe6iuFlrAzUNUircd9/RRDpqMH+c4GG2fh0nL1nBI79F7OWLEyt+ZHCIl+2W80QNBbyaMtxssbUfs/5mNoWwFkocDIZix/8nyg7ZmMBbXHA0IqqcbxSjbWNuRC7lKZFLNIDBuAhYlkkKGRoYX6rsxCX325ZX0uP/stgf7ttr4R8+m8M9DxuEN24jc86CE8KY9/3Mtuag7Ax4jOPmx2SG2dVLhvLc9jsXvFBqAX+H68lXzR/DpOf7x9Sl2W1vmZ1iKMiFfcxbH5vDPyW+kHTMXgaqzLaTPQAbWAKchv4prAi0KdGU+w4lBT8C5eRQdHZK4hZ4Zj9IS/8Ws45Zsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNF+24GmbE1v/d2YYMPCNo5gUVFMWsu5+kDuhFQOMxQ=;
 b=TmmmuQQ6HmMQSXfy7onExw/yZ9xZn0ua0QnCpZ1PtGbu0tDArlk6ofcnojcb03lU9S4oWPZ4RBa3ghjhGAMBKPLSpOhUKledE9sxIqTMn18lPmSrth5EBan1t/Iww02Fs+Cr8g2wT3emoa8P6pvllFBRcD5oQRfa9YaoEgWGgLuRqD+nobmPi8ot3oKcQ31gDmj4jPS3SjWUhDjlXfpICR+sj/jLpSkCDjcl+QqdEpVrvWtDvc3z9gYuWgwBjPqkpdojDn2dTJqVlRYEZ+Kqf7K2FeviyBkNzQoI1IkfvSadLyyIJqMVmAdr/+mmOeU2xSSDcK2aWUA3Dxg1xS9Vlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:40:33 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:32 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:44 -0600
Message-Id: <cover.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR0601MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: c3327ec7-99d8-4d38-49ac-08dccbf4125a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hKGr6t1iAJiuZ3T0cHvjGKNDZ2lx9ZnPQaaHfXmYLgvbkzxSmtZdGYVWkXWw?=
 =?us-ascii?Q?uxMqRP2rI9JVoGTqCB/kqssUtR6roVEuAK21n87e3X03pINkUg65xx3R02dN?=
 =?us-ascii?Q?F4/D8jOosfVIBTQHm+6fI4SaPYzWmGPPgq6xNuYj3UCuDRnzXX9mUsfCh/Gl?=
 =?us-ascii?Q?fI70+4/XnOHEcVfsYrO+1xGeA4xe7hd3CGNts+J3nO4EOr/IsknwV/k+7GM3?=
 =?us-ascii?Q?pxYT6cGuX/tU54vyWkHZWGEDOQzltXACRrJieKjXLUUCGOKb8FvuaUJ0yTTX?=
 =?us-ascii?Q?K+50Rf9Y9HZry+81yyfKFBctfDAvMgAgNu9D7yRkFypxIKmk2VH71pRx5ExY?=
 =?us-ascii?Q?ghFldkQZdSZCIIjG47TonxnkNQbQuUllfLUKAsyQlvVc77EXMc42R82utAKu?=
 =?us-ascii?Q?tozveo3YndyLoC26+2SE87AQ7sBKjL7RrF8ocjx+eJf7CuIp40EXVIEOJEPP?=
 =?us-ascii?Q?AkQCsN0RiPRHyoGtRXfFGruRXBPthGulveaCQIPJAYzglori3Wvc4dYa7ndA?=
 =?us-ascii?Q?K0NzcppWzIgy66YdV408h+JW6lFmBlZtMTuneb16ZXQaMG+A9bzrsfTjtZFy?=
 =?us-ascii?Q?aQmUFbcg8vcAwTuMBXDHzYd9gLNrvciJ76gquG67Ox1PwCI99fCljrZhedGd?=
 =?us-ascii?Q?jZptfiZIasSBlyX3oNcv/vBSyaJhMoTfZoWX5L6ae4NLa+fzypCUZ+CgMd1V?=
 =?us-ascii?Q?aT++aKnGfD0vJ8i+PFgp2CUiV9x6EQMnQZTV44WX67dl27sjj5Uhq27JG91S?=
 =?us-ascii?Q?XQfU8CU1XqWUaCICf/qKIqGaF0AgqDjS1TCPOGnrvpejJpNL6qxKhbYHjhQI?=
 =?us-ascii?Q?YjBCD6EM/FjVTryvhKquVLmm/nvpO46LuSGBdEBUCmoxC3FRMZP1Rqghyjad?=
 =?us-ascii?Q?Xdtd+0geU+xbRVw11OqcaxkiRbudDQdVVv8TRsArvKhFV/IRavW3bd63/JC8?=
 =?us-ascii?Q?xMLwoZiyh155ZjfknOM2y4xPgGAP3URe95SIc/PPpdMryuLPkGvet2qg4mfy?=
 =?us-ascii?Q?JAASxmpJsw/VcuNi0+ooAjigCaZFV3j5kSHX7Z4+wYkakNkSQBJ17T3JByqa?=
 =?us-ascii?Q?LjAi1+UQqzEKj/fXUWNlsNCNZ3+8wrEpMxaSNVANbk29DMWD1wHEOIMSiSn0?=
 =?us-ascii?Q?TGLtaQKD1tKceN1R2tmGGdI98dzVGnlTEyqWFjYL7Gt+jIayE0/s9K6XLGoi?=
 =?us-ascii?Q?PRdL4zBH/ZpHYybbNAcImiWjsMd34eglNmTGN3o9kkwR0hJDBuSgkyD1WUl0?=
 =?us-ascii?Q?ObHunREkFiJW6gZayuRuo5Y6ipDUidou7xy+VTcNLili+P/s2r5JVjPVi3Z1?=
 =?us-ascii?Q?2/4O5qJorxBSkxGNPYrx7NXkPOaHCFLnUKkXQndarx0Ow6z7oyR2n3VowT/i?=
 =?us-ascii?Q?sOg07yx8nkkCiCjOs1VzXcvDvxk7m/AIrt2Yl+S4CU+xkyGZjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n96D6d/hA10ZECVa1OXy6AWcPMmU4b6knGrJ7P6AuxFw7WwuflFY1PSJWG85?=
 =?us-ascii?Q?xZc5tSPLWdPOcVzRMEm+vx6I4cY1utcEKjwotswtKQ3DFWL2Xng7b295p4m5?=
 =?us-ascii?Q?0KAe9RHLmULTcLuT+ZZ7vRM7uSKZZ8QHcYl/egvYJ4p6D8JWv8FF8dk1Bj85?=
 =?us-ascii?Q?1P+JaSoxKagZTf088EdKsI6E9b5MbVC4x7WQWfmMnta55YNn3J+pD+kIFN2F?=
 =?us-ascii?Q?8St7nHfEVVloqdA+OVjlY9dKmmI7j8Se8/EnDPaIFJcs5nKc5xjj4dtN0+4l?=
 =?us-ascii?Q?9lPSB5275wXcZEJFzVQqD+16KbJn1yugWFJH5AQ1yMwZw362dvtyuq6nQHMp?=
 =?us-ascii?Q?K/YZOm94lq1vHpfuafiQpErB9r8YpI3aZjBEz3V9gOC0NsvVvOkredvY1Mgl?=
 =?us-ascii?Q?oeCD9TxFO7mb+OMtPqhx8N+m9cJynAizuCUyFWkKfaBvx8NN1bPwd+v3FOEZ?=
 =?us-ascii?Q?RI9pscKm2l2GyQVG8jFoNGQUNxs9EBm5N67wkMR+DOYidag4OAnTuQ6Oqu9/?=
 =?us-ascii?Q?6grUrWLD9b7D3n4l9IESrrkSxNKxd0a0O/5qfyPg/o2ZwxvaRFQsLCMHyvEK?=
 =?us-ascii?Q?5FAO+szCzMv72bajNJdYZCYWnWewo0oRIwFg5h0it/0EHbh/K53gw+1QRGfZ?=
 =?us-ascii?Q?C0m9vFoi2n5IX8MPT08nui9D1q9fbMOdNj5HAOF2LFw5+ccHE0IObgh62hnd?=
 =?us-ascii?Q?8re+/cUTomRq19vuGmzvPdZJNsc/DaB6Bx5oBcZF6k/Lz9HOpsYmHDn+bwqD?=
 =?us-ascii?Q?wcJvfOQNxiOMJGiH+pX9Hxlpv5xM7Cw0EY5qhCS9tNS6GKISZ8KwYg9ya0ba?=
 =?us-ascii?Q?BRO+D+Rb9A33tE1RQqrKZ/GKpGOJtuUA2UKLEvd3Y3dd1x5fXwIMtYuCfZJZ?=
 =?us-ascii?Q?1RKOCYL5FCl6bCvAmFdC+aj+NqW2S7Tr8fl4SrFGIEVriOZFVfq+B7F4jmAv?=
 =?us-ascii?Q?l5Fkw8R05s49suSnSR8NPbtFsPlk52miyavmzAfzjfULNN9/+J+n0COAzkya?=
 =?us-ascii?Q?DAgPh1NtzbOjm/eTCMpkqiT3wr9qn0xeiPzF2pHQ52sIwr5C2edt22TOZBOc?=
 =?us-ascii?Q?bBEPRk4CTpVxGSy5o4irrTZlQOPHSLRTW2cB9PHE1R4hsUsFMD5V86VGvHpA?=
 =?us-ascii?Q?xeC54P/EBuv27szjBPGxn90G+b1N5ypK1iCkfLNQlhmqwRMpWUa5HBt69JiW?=
 =?us-ascii?Q?0Ak4Ov+AvWvsUwOy7/NNud4SB50Xtip8Yq8U2pkJMZC/6SKlPScnmjbdU3Nr?=
 =?us-ascii?Q?38Mw7znwdgB3P2erG+RKgetban0eZ1McOm+VqQQeh7BGNNYeWVX3PNo1aep5?=
 =?us-ascii?Q?h1T07SAzS14Cjnk9MfVpZwDSoW2I4ivQNVHAAaYbtGbpV3e2WG8MYOwxU87G?=
 =?us-ascii?Q?HdDCfXBzOSf9mERhDtuMWo0M31Re3/sl2/mfKd8wDDXbZjESg5OYVqY6Ul5t?=
 =?us-ascii?Q?6PyO6s47tgIV/l8hv781oSbukM8zSqEzC1SFxK7mK31tvXeL8YlCDgHH/PLX?=
 =?us-ascii?Q?lJ/olKgp1qAIpYlL1L4VZu8wCxhZayRpe+KbanN/bxBhwlsnnwwq6eKSHLY/?=
 =?us-ascii?Q?vwYJ5FGnQhGUrYv1aIPkOUGFV02AojXIepyXEquc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3327ec7-99d8-4d38-49ac-08dccbf4125a
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:32.2052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cd1sxjPayPR6lkrvfYHxt3ZKVLQDEaIWHrpyMoIIMMLR2VTtZGOlTOsTjWaBZxC36YwQgDkF4nh0i8MPayePMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The inode in F2FS occupies an entire 4k block. For many small
 files,
 this means they consume much more space than their actual size. Therefore, 
 there is significant potential to better utilize the ino [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.62 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slP5d-0008U3-UY
Subject: [f2fs-dev] [PATCH 00/13] f2fs: introduce inline tail
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

The inode in F2FS occupies an entire 4k block. For many small files, this means
they consume much more space than their actual size. Therefore, there is
significant potential to better utilize the inode block space.

Currently, F2FS has two features to make use of the inode block space: inline
data and inline xattr.

Inline data stores file which size is smaller then 3.5k in inode block. However,
for slightly larger small files, there still have much waste.
For example, a 5k file requires 3 blocks, totaling 12k of space, which is
more than twice the size of the file itself!

Additionally, the end of a file often does not occupy an entire block. If we can
store the end of the file data within the inode block, we can save an entire
block for the file. This is particularly important for small files.

In fact, the current inline data is a special case of inline tail, and
inline tail is an extension of inline data.

To make it simple, inline tail only on small files(<64k). And for larger files,
inline tails don't provide any significant benefits.

The layout of an inline tail inode block is following:

| inode block     | 4096 |     inline tail enable    |
| --------------- | ---- | --------------------------|
| inode info      | 360  |                           |
| --------------- | ---- | --------------------------|
|                 |      | extra info         | 0~36 |
|                 |      | **compact_addr[16] | 64   |
| addr table[923] | 3692 | reserved           | 4    |
|                 |      | **tail data        |      |
|                 |      | inline_xattr       | 200  |
| --------------- | ---- | --------------------------|
| nid table[5]    | 20   |
| node footer     | 24   |

F2fs-tools to support inline tail:
https://lore.kernel.org/linux-f2fs-devel/20240903075931.3339584-1-bo.wu@vivo.com

I tested inline tail by copying the source code of Linux 6.9.7. The storage
space was reduced by approximately 8%. Additionally, due to the reduced IO, the
copy time also reduced by around 10%.

This patch series has been tested with xfstests by running 'kvm-xfstests -c f2fs
-g quick' both with and without the patch; no regressions were observed.
The test result is:
f2fs/default: 583 tests, 6 failures, 213 skipped, 650 seconds
  Failures: generic/050 generic/064 generic/250 generic/252 generic/563
      generic/735
      Totals: 607 tests, 213 skipped, 30 failures, 0 errors, 579s

Wu Bo (13):
  f2fs: add inline tail mount option
  f2fs: add inline tail disk layout definition
  f2fs: implement inline tail write & truncate
  f2fs: implement inline tail read & fiemap
  f2fs: set inline tail flag when create inode
  f2fs: fix address info has been truncated
  f2fs: support seek for inline tail
  f2fs: convert inline tail when inode expand
  f2fs: fix data loss during inline tail writing
  f2fs: avoid inlining quota files
  f2fs: fix inline tail data lost
  f2fs: convert inline tails to avoid potential issues
  f2fs: implement inline tail forward recovery

 fs/f2fs/data.c     |  93 +++++++++++++++++++++++++-
 fs/f2fs/f2fs.h     |  46 ++++++++++++-
 fs/f2fs/file.c     |  85 +++++++++++++++++++++++-
 fs/f2fs/inline.c   | 159 +++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/inode.c    |   6 ++
 fs/f2fs/namei.c    |   3 +
 fs/f2fs/node.c     |   6 +-
 fs/f2fs/recovery.c |   9 ++-
 fs/f2fs/super.c    |  25 +++++++
 fs/f2fs/verity.c   |   4 ++
 10 files changed, 409 insertions(+), 27 deletions(-)

-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
