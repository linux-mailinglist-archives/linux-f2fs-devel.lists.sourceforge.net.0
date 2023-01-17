Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 372CF66DEF7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jan 2023 14:38:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHmAd-00036f-Gi;
	Tue, 17 Jan 2023 13:38:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pHmAb-00036Y-Hy
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 13:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ilc9EmlpFb+C3SV5SuHf0aAd/yiSTPSIvy4GYP/YE/Q=; b=hOEWDe4UD6cx3wv3hfUM+dJtpV
 igb5f/iSwg4lx1YvlKbuPNJwfMCOyDH/i75BpegSf4WuXSrQXWRkycMlJ20O6JuXaoor3crBx3ISy
 sZt8RYl6z3OJx1dgfwxXWCgY0wkgcc+gEJ8I80Hx9Ae6faCK/H39gZj1bPoUfP5I8brA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ilc9EmlpFb+C3SV5SuHf0aAd/yiSTPSIvy4GYP/YE/Q=; b=en1WG5IA9jb/q+pWikYnqLF9g2
 77g/fmC1+WNth41A6gh/q+TFSrBySHmhVRMuptFJpsGHd/JUXDK8SH3ZePwIOp7Z9+pcY8xMinKaz
 Fdy/0A7t6dsqw58J1kTUqVYtnhY53IVmBgPB/bXoRVv5m9GCrrTt9v4sZ2MbuLfAl+2M=;
Received: from mail-psaapc01on2122.outbound.protection.outlook.com
 ([40.107.255.122] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pHmAY-006snw-Bb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 13:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwqKAFxxLFrKV/xss4gCtCQsSJmdUfMvvdg8CuLBGVg1kvlk+zhmLAamJS5fWx5AeZPpe7kjJiUsxE9WkIeaZ5c0Dm4olrLR7GeIYUViBTx+bH8alSAB8dUwruwNhs+l0s54g0mYqPqbgggUHLumNOnuqVZ49Vyt0s1pixOORlZBT0qrUoNoUYK/8CtYs+f8KL3fdhaqTMo2env5LEMlICR55h888gdUV5sE+KuZvgPi8V/rC48eKom28Vq9mvjIILKidRVGFuIa5TdDkVcFn9pLiv7yMHTxEFj1NXeI85A8jHZfLuYc/2xrrO4ov+2agE7YsDriF1oHZFlThnB7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilc9EmlpFb+C3SV5SuHf0aAd/yiSTPSIvy4GYP/YE/Q=;
 b=fILtVTfVsniSVCecKoJS9cZPLUawDnYbWgfKHg1gL2Xrzm0iNYNtu5fmcskRrBt2mzpIHPXXYnbP7tbVoVPZPIIo1l7YBCF5YrMN0dVFn6bkp3w6JEuXvumzN4XBU+r6Btdt1VgUmGBs4xW1Rr8wF7rtB55zxQjw4Azs5pj4NOyANE1cmYMHI4pRLneLTiggH7Sm7uqnKhLx4DzU5/qPgvxtrJeV/oRpl9cvRdnoaVBQ4YLWbWBtyidBi+V7PDTE2RLDe0lZnht4qjwxCjATn5ysyglpM9xR+caqlzIw3nPW5cID0nTcLK/cQRVzLxB9DmtYAVWEaUwYJQL8dhS9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilc9EmlpFb+C3SV5SuHf0aAd/yiSTPSIvy4GYP/YE/Q=;
 b=ag+31l+EGnNLzXDdJdKjpOXf/fmXY0CCDQq5nz3P2BeIdFJoaXibRI31H8T+5k04aEncvXkvfJCGZ0Vxz/xEbWoNxQUUO9F5KjUbYKdezUnThgJ/+hmU+P5njus609FLKdPUuY9LF2hOXHdfPYcgLdv0yuRDtXLsD9ZBju709QpLkQyGSrCm8L9AEn1drw1UcTML6Gh6ifHAp2DjPQG0v9zIeCJQa6LsElvjdBDkBj9oHTtgty5Oubce0+JOzZ/zxhNPdT5FcFmlXJ5VBU+xz6KL5W779aY5LcPCN/RkJIrrIp5nAmUga3rW7kuXoaL1MJxLSoaiFsypBtaMdJc5vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6239.apcprd06.prod.outlook.com (2603:1096:400:33d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 13:38:22 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 13:38:22 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org,
	qxy65535@gmail.com
Date: Tue, 17 Jan 2023 21:38:14 +0800
Message-Id: <20230117133814.79508-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230117115702.GA12653@mi-HP-ProDesk-680-G4-MT>
References: <20230117115702.GA12653@mi-HP-ProDesk-680-G4-MT>
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f13d72-b2e4-4d8c-0463-08daf8901a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: erMlTJc0E7AH0VfygKoBRAI77DN5Y6cD4akAxLUtJCtuKAzGQqRvrvwIBClbztL+6V34QqWwqEMEVxEZD9Gtv7OVOI1yI5h1VMCm1nBwaCMb65b4H5c7LDFhke473zPlZmhlkLcMKplyWP1u2TREjBQZb5fMddB89ZAemkuA5rmWpISVKFft5+2cuVCESFh8LeiNRQm0NBqeclF/RGph+tm6Of/pGkqypo7IMyN6N0v+ydGFMv/dXjthGhacG6mjlTkOHYgYYqe8Lv7tc1v4yqiJAbBcgkI1+14Et6zJ2gapxJB5gSgQ1G4WIfO7zmtzQ5yxCjamwUJOE/bc9CivfD0J0tLYFBhUA9rrd6bMsc3tmSbbzEWHANcfa/bldbO6IxtU/Gyc5ZNjWRc2LsdvkZT75EtWe1BpgyLnJXCK3c2nQ2vqYjqVAsVZuAMncxdVGQ8yWvGSlp5lYfwgp0dneeTlDerciThd4S9XTjRt1lEng0frRCCR1WtgapeyRc2vosMrtN1OIXCHn8ToZs2JPiR8Akk/RcTL5LmQvQ2myxETN/31pruplXLMa4wQgJWJs9pTGLkw4XEASiaswovDY8Ey+Rt2G8sTHEOjvPDjRZ0Dga1anzwe+cfUFfPoD0EyMCpbROFZAN3nQq9XrDC0zPPbKtdfAEUWByxv+9XX0GCaeqWkAb7GmUJF5wocJCL/v3lLdknPzRAuLIKObuIdvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(39850400004)(346002)(136003)(451199015)(66946007)(8936002)(6512007)(66556008)(41300700001)(66476007)(5660300002)(8676002)(4744005)(186003)(86362001)(4326008)(478600001)(26005)(36756003)(2906002)(6486002)(52116002)(316002)(6666004)(1076003)(2616005)(83380400001)(38100700002)(38350700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UkBUXhleP3mst3Yww4uiBQxjuQZPiwm/JWMgLYPyYO+JsWGYbB8nncNSAT4b?=
 =?us-ascii?Q?2f6OvSBBki0nj5BA5tjzeNV3FVsBaSS+61pfVmPBUNL5sFe2LnE2u1WXTXvH?=
 =?us-ascii?Q?PtvdOCMn+e77C/0tQWxPOqVsMM5Wm+GX5BuhLI+7AOAz7f3AZpvAs/Yw7JGZ?=
 =?us-ascii?Q?kZJCtUUr0Qhr7+z2m1yRYY7L/hYrzrdtAYu6t45a2OAUeAod5AjVTF5I4nyG?=
 =?us-ascii?Q?EXbO+cwTAgMZa4HM/RbQt7Ipsj9GVIy8itKOQ7roiyzZlP+o04ilz7PhgrLe?=
 =?us-ascii?Q?KDjHpWgrLjIBQgQDUU/vTU2+bg6LrOtSqJGq2wmhztdKdPK6/79IrCXezd62?=
 =?us-ascii?Q?CIr3Bfh+JKOnJUuYSQ2QqB6WS5SFHQXIUivqBiXPzZiVgWdRO9QsgJm8F0wp?=
 =?us-ascii?Q?UBNH5gMRsIeaEYkDDMStnxdm2qcspERiSOwwH3okrZibFHhY17IVdPn8A/V9?=
 =?us-ascii?Q?ZqL5RMh/J61ZNIXlAuioJCEoWVcfHcsdpz/FN1PeGL6oFJEtbs/gnCJOf3AW?=
 =?us-ascii?Q?IRoD+dlDO99WMgzfkONLKAtsLDsqZAn8VRqLqIddro+1pqkyaqwZkEtAfzrG?=
 =?us-ascii?Q?Ij4D2kZMuABneZfvmNW31qYk/pD5zVofHt1y1v9hnGpXz/oYHehzGheoLTtg?=
 =?us-ascii?Q?wZjT3KajbRyrjXWTn2yBtfwkz1F+QQDf87zegWvkdtRNp0qrWTTwxH6bz8KB?=
 =?us-ascii?Q?f7vMn6mtl+kVHbgZaXOelXa1lBx9xypxLpA6mC+tiryyrRrA3ZqlqYc+jRWT?=
 =?us-ascii?Q?BHpYY/o6zQKu5ydljSpmxoPnLQ6D798E7cOCZ1L0iNyVDhLwU3tsnl5EpMm0?=
 =?us-ascii?Q?SvQwhXL26qiWbZyf124YoaybTBz1pP7ePam3v1v1Bi63GDU33RzoL/KXAfRN?=
 =?us-ascii?Q?mMDZUqGlmkR3u64RanWSx4gPKPFkaw9E6xJct5mfwwyNLHTGU2t06TF5Hfv6?=
 =?us-ascii?Q?4rLVLkhLGal3i+luZKN7d95fUm9+0zGDObYD1v/ZrwI7Owc0Z68nRwCmKphL?=
 =?us-ascii?Q?J0f0B2YovAqhtHkHSjjYA22cd4t3n0R6vsthZw1+qPFGdtrj3TS0xbHjaE6i?=
 =?us-ascii?Q?9rya4AsBLOpgsIXU0CUMJcUaCU4bisAjZmdbpib7GJYPpfeLGlmmir/gJ9KO?=
 =?us-ascii?Q?mBpH/AjZ+UgC6zndC5IkDK02NYIVeCsYYbDoEQvI0dBfJzUe4t4pXqywE3/F?=
 =?us-ascii?Q?nrachXuUgoOJDzstayfvC7KYJTC1Ad7HdcrX7w/DqeeTNYrakWr0T3un054C?=
 =?us-ascii?Q?c0b7701j5foMwC8/wmBKb+MxP2ElsIQcYVXI0rs4pVQX1Q+tGXynFlzaKUPi?=
 =?us-ascii?Q?adrPL9fZqFwIcj4as8gbDX/D2NHdMLPq5ZVU65FVoW1iY6gxm6pEOQCYduun?=
 =?us-ascii?Q?AQbaZ/Kym8gNOwYLEnGMDAiv4BWnmjwpj/oQcLszTZsiBZtzpooF2gg/Ci4S?=
 =?us-ascii?Q?BqUA7qY43RhnRkr+nHvVuQ6Oi3ERIuIh/Lvyksn65X4QKtuupb7qoeUqqC63?=
 =?us-ascii?Q?nqF3cm5ebAm3G1zpbNJGAYGB1cbv8GuIuW9bKzoftbLIh2/+Z698KeavSgDp?=
 =?us-ascii?Q?d1WgFXR74YWn9hhOZtOmgG0BR7DtwjrX58hSKdKM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f13d72-b2e4-4d8c-0463-08daf8901a00
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 13:38:22.3565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6D+wmsbqFcu8lKPcCee/OUFYatIVNNDdYcyUVe06pIKYjSR8Ek0fif1MGWF6pZBFcOML1PDvg6vro4YwJKNGPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6239
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi qixiaoyu, > The block age here refers to total data blocks
 allocated of filesystem between two consecutive updates. Yes, you are right.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.122 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.122 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pHmAY-006snw-Bb
Subject: Re: [f2fs-dev] f2fs: set *_data_age_threshold according to
 user_block_count
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi qixiaoyu,

> The block age here refers to total data blocks allocated of filesystem between two consecutive updates.

Yes, you are right.

> So, it has nothing to do with storage size.

But I think that the total data blocks allocated of filesystem between two consecutive updates
has something to do with the storage size. For example, for a 60M f2fs image, the lifetime_write_kbytes
will hardly reach 10G, or even 1G.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
