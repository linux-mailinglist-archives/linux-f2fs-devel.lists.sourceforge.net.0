Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3E694805
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 15:28:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRZou-0003g2-Gc;
	Mon, 13 Feb 2023 14:28:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pRZor-0003fi-CY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 14:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O8WdxxNSKMC2zYp85qilVuhHP8ARrjmTd0+tkuvP27A=; b=PaudVTnaKsMOeuu3Bd9i0Xorfk
 DF6tI6jnWUmn82ekdjHgCWapNvBuTBuvrdtHE5DxEQBGva2emxgO+o6qs4ckZhP95vnjmSvMeSIL0
 jqwZDcdJOZmmEFc7NhT+nfO07JSWQDDj7VqtDzHaiOMCIma6uoYQWINHTGoA1QikpBw4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O8WdxxNSKMC2zYp85qilVuhHP8ARrjmTd0+tkuvP27A=; b=eOkuymmnZmUDicMLU9pZij5WwT
 UaPuHQfK4erEXYnRH3Xf6uWo0h0ZXZDOKr/E/L+49Ma1P1ZviTKr49lapCN5FPUJzYQhhK1EH7mkX
 QaQMamg52wmPGRtodywCacQjpi+GEk7wf9WeNDoXFmT+YQBDX23jDUSQ49fdSDNRH4wM=;
Received: from mail-psaapc01on2103.outbound.protection.outlook.com
 ([40.107.255.103] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRZom-002qUM-W4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 14:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C74Zku+bJdYXMdzw176F//9WksxQ2aWzOW6uHgmchTvwlDQ+3XeqFmM8BReHIIvbOMnNW7I+RZvtviTnbqTQVjEMXmlRmkqM//RqDS8+kCtcNXE6K1D9faqkrEqcxtW7YmgsssY7V/ezLKo7z8eLSilMD0ANdA2zQ55l811brOIRto21pL97rDM4DPgQ0CP3IR0ZSfJu43pdLPor8HfWnf7fujC53awP1p+Gk82XUNh77u4BA0SlkJ+w0D4EQmqvYDMUudM7aOgPu5vsTYY40fvDAAPJrntlTvTXqcwzwiR7n6xbskUMXNR7lMcAqXFHABQ7VbwNBvuF6kUQYqfm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8WdxxNSKMC2zYp85qilVuhHP8ARrjmTd0+tkuvP27A=;
 b=jS0JcHanvZvZ1PE6v4owa+R4lN/Y2Ys89HzcPmaFJY3PqAYt5odK9BF3GtX3V3FziUiURoKkfOqeeiisB1Ul3hev3Hh69FGiCQ1oyEO680CbFjYk4pXFMYNR9cgSyexDJPSj+FgxML/X90F1+kgsJdarVbQaeu43x50Xk4e5i9rUNmw1Zoj8KGzdJ+AxF4EfLA3Iu895lTlj8g3JYO4fiAo1TAMoX3+MqIWLvckYPsPuFl59M8tL7qMK9F0aCHPAqRWT6ej3hA4MI8XLpYRPL8aoK1ampF1oCNrq6YaSXWn1dpa0EK/EXpSUPBNyvFvY5/5ybcWxsBYNJzdBc0FCdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8WdxxNSKMC2zYp85qilVuhHP8ARrjmTd0+tkuvP27A=;
 b=n21j/3g8DH5h+ek7CiJuKP7YjHgqB6uvIhUF7Cq3FFRWLCAiUvyfWkDwQaKRFFxdpwMTC066u5Wybq7vza4EbKDnUwtkuId4P95QKFzLKQtouiG35Hi64m76k6lgLabhmTp8sag3PdGZf0MmrDERXyWhhlPAtRuFCQIr2/ExGIa8YuIfkucag5n4cGTJ25RNj3jJoh+EjSegnLYZH8g2VWkCXnDnCbtoFARKXCH0sZyxncljRVFy8T6V5FLc50uTe+lCQxTAg10ijHqhYe0ipyctlaZcPsN/flIGWQPaL53KshotTR38c6crEevDKaprP2rL6IpGj2uWBL8+aMXGYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6234.apcprd06.prod.outlook.com (2603:1096:820:d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:28:24 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:28:24 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 13 Feb 2023 22:28:15 +0800
Message-Id: <20230213142815.24095-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Y+a3a0eSkhVUh/RG@google.com>
References: <Y+a3a0eSkhVUh/RG@google.com>
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: de50e1ba-358c-437a-566c-08db0dce9066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5LtH8TWBCfwkct4o0zaecJuB8xbjjA9wXQF95SILS2Q1ME3eeY2lk7WZxTnDvHJ9zzRG0LDQ0m6wjDTn8YxDNxonYMMA4BEUtrXzYSDr2rmJMfpfb4NX3nmoC+G1D25/P9dF+l+ruH5/5G9V8GcQh34zR8hzj63AGYSmY6nfh3WMhSNPOna3JcwY1qYY8QcFoAY3EZx+Sb1uvMwmGdnYxnQQfq5gASLl+dNJgtOuqB6wWTGtDeDRMaMXco7lOHLdKXgx/etUTPRKaznywaOaz/199gL0D0gXz6ozsyiBOEKQMjF/UObKdH+CJXFh3x2508xaVb2ndHcmQOqYlQ4yUfyULxJ+4ZgPMTDoSUll1tywnfsS4XTYvFet2VhTx7eAxkuCq/ceUeJsDEM+idO4cQvXBIPkP36sFluJDjYCJu3RlLurz7MsdTgw8RsFc9361yxR3CM9+LjjXF/gWSFiktWpajzXmhKK55f2oVXtubtRLiF4fNnjDcZZ5jCWIo8MMSDP6tkKKnoo224mrZZxX3zTpk9HJ8tk82r8+7TqqznsurSVquvWHagms1IjoQAo9KUbZXSjyzxBKprC1bDhPkQhtL5M4vTnRXVxwExwf0ziUpiPXl5qGn149Deqbi1c1X0tYR35EFH6IW0wC45ec9jdJMNCdd1lpLHrhHZmu4CTVi8l1YqHeLiAnMaZ2XSOwHos/eXuZydOzaSP2zH8uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199018)(1076003)(26005)(186003)(6506007)(6512007)(4326008)(66946007)(8676002)(66556008)(66476007)(52116002)(41300700001)(478600001)(6486002)(83380400001)(86362001)(2616005)(36756003)(316002)(107886003)(2906002)(6666004)(38350700002)(38100700002)(8936002)(4744005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uyqUaIeIqSFCc7d+Ljgq2tdfLgu43e3FqJ9tqtHA6d7cIXslpYUo6twKD59h?=
 =?us-ascii?Q?5MS1mL8y79fH6ES02IaS5IbhGZwFTzIxvdGBKeIS2knQBDImyytIjbwxnc79?=
 =?us-ascii?Q?ICmFGespJHoxaqqaNCrvdau6t9aK9Sn03/CCQo2hmFq7Fbz3Mh2VKiROc367?=
 =?us-ascii?Q?g++StyFxujUOwo3e+75P66VtoOKNWLesQgfqyBmn+4KV2Li9PLFnIK/09Q4J?=
 =?us-ascii?Q?l8L4NnESVKzTEuNh13bgxeivN5tKIhLoq1NiPBfw1gv5Ib5Kgn58eTeVKCVx?=
 =?us-ascii?Q?YhqWYpQqfZ1uDuHT26zSgw6g3F0xB0tkBvCHZIaTxx+LWnJlmf9tAcaO8REk?=
 =?us-ascii?Q?k1ZCJ7OEFz0+llt6n8qa/n5IcSE1jHUoYKFJZ6gZe2jmK/4399ydH205vvbk?=
 =?us-ascii?Q?EKNlE7qoFCNoVLsC7iDp+WJxfaO+v8+8oDKWojtI2BBI+zSmQi8dVaVwGNv1?=
 =?us-ascii?Q?9ua+VkdvDZqh+91hyfuDzJ2fhsR8XSz6UL8eQqo4zG0w1jiXpPVQzsU+Hcy/?=
 =?us-ascii?Q?ir1/gx3HpdPiE4Ghluwks5cFTFaYi/W9vYbx7HAL9FJbKPJnzYnsnIuS/i26?=
 =?us-ascii?Q?kQdS1KZmjbl+d1fPTJVexSuwOtMgw/Iv1fd6PQgctp26P4azS6Lnnb5o3oTu?=
 =?us-ascii?Q?sXwpKhvGthDNZ1sNoC/bEGQpvlBf0IMq/FJPJbmGXMKgt5ZNJLJT3z0i8419?=
 =?us-ascii?Q?X1neot3iIDOryZMw2IPihwyRxUZFQ/nzmtNmMVvp/xnbX0+MdtHtX6y5R16N?=
 =?us-ascii?Q?Oe5N0nrv3gqC+HqBdHSkZ6H/2FX+mTtWFjkS8IRM9R6fc0Fw2jTD9MMW1Guw?=
 =?us-ascii?Q?q4gTDuseYyFqUQPBkBQVZyrtR63qRS76i4IsxazSjM8ZxKSfqtTxiD8ui3+A?=
 =?us-ascii?Q?pzPIr1+B2erZN5mawOGgTbP4+k3sZyBzFShN/XypaEXazLxwDz4tiPmDv3aV?=
 =?us-ascii?Q?MACaLB6/j1hcLQLqBrNt7dDsXyGJT0IfmuCgtzahAW3F8KEIcPQOaeoC165A?=
 =?us-ascii?Q?Ez76r1grSPz5slzfPnQvYZkbyCCJQfbGzaN9EMTLq31ALf22arwUJxTUkiY/?=
 =?us-ascii?Q?Q6BlhpeGSk+YQVSf/rXY8GD/MBtwiUjrDOXzpw3zPnTo0Y0qxyMzQYLr1/JL?=
 =?us-ascii?Q?jy1c8Az5a1I4944nDKCNGAakoiNV22BXKk+w46M1Hp6PDOf05h5RzIWAGxmt?=
 =?us-ascii?Q?b4V48iXpGcGYQ5Y4Nwt0zLqdoZNJr5C+9j5atk5lPv5HsFRM8+D9HNsNcwmA?=
 =?us-ascii?Q?fQfYdajPrezTwT6XF8d3/6fiBvhiNttX70wvqumRI/Q+gEB3ReQvxw2AaC25?=
 =?us-ascii?Q?Uv8bdp1KGgxBwEGrSt82dhdE5FMHfuXjTI5yxn85yPAmdzjw2lzKgtGPShU+?=
 =?us-ascii?Q?uAEc0Iad5N5PddFfPIJtGVqpq+yrDZ1HUKO8gbGrARbD1SXoJwgdY4DLaTTS?=
 =?us-ascii?Q?PLgj1Zi0XNpTMO/TIp3ZzKJ3Vb7ToC0EFWJbka+WzGJwyk4jmD/f3G0RvSxT?=
 =?us-ascii?Q?xarFa12Gz+0IQ9SukeGaJQw+fNqLTq9vOsmmVGIb0uUoQzTaz1X1F7jK6cBe?=
 =?us-ascii?Q?/jUPqZjHeYr9K3qlkdFl5syqGKakRq3nftIwn+73?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de50e1ba-358c-437a-566c-08db0dce9066
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:28:24.1981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNMi0RWjB+DjzNRTfSbb0xQnv7O2vA12hD+DXgEP455YFf8kwBVJ/9Nwb3htcXs1U152cSNpTizbkcqYyAMgzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6234
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > > - if (reserved != cluster_size - compr_blocks) > > -
 return -ENOSPC;
 > > + if (reserved != cluster_size - compr_blocks) { > > +
 dec_valid_block_count(sbi,
 dn->inode, reserved); > > This looks brea [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.103 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.103 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pRZom-002qUM-W4
Subject: Re: [f2fs-dev] f2fs: fix to release compress file for
 F2FS_IOC_RESERVE_COMPRESS_BLOCKS when has no space
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: hanqi@vivo.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> > -		if (reserved != cluster_size - compr_blocks)
> > -			return -ENOSPC;
> > +		if (reserved != cluster_size - compr_blocks) {
> > +			dec_valid_block_count(sbi, dn->inode, reserved);
>
> This looks breaking the consistency?

Sorry, I didn't get what you meant. Can you tell me which data is inconsistent.
After executing the F2FS_IOC_RESERVE_COMPRESS_BLOCKS ioctl call,
use the fsck.f2fs tool to check and find no abnormalities.

Chao, any comment?

> > +
> > +			for (i = cluster_size - 1; i > 0; i--) {
> > +				dn->ofs_in_node--;
> > +				blkaddr = f2fs_data_blkaddr(dn);
> > +
> > +				if (__is_valid_data_blkaddr(blkaddr)) {
> > +					dn->ofs_in_node -= i;
> > +					return -ENOSPC;
> > +				}
> > +
> > +				dn->data_blkaddr = NULL_ADDR;
> > +				f2fs_set_data_blkaddr(dn);
> > +			}
> > +		}

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
