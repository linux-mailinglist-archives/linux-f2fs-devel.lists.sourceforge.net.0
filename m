Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD746D45E7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 15:34:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjKKG-00084E-4A;
	Mon, 03 Apr 2023 13:34:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pjKKF-000846-4r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 13:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VTez6R8bzI6+U9MSF7pS7I+ZvH7q1V51mzcdXTL8nYE=; b=K7wvWcVwGXnPgH/czuMiyhMZLy
 DZ72Z2ILzBgvgchBI2Hvu8LxMVl7fO2+Xz7QWQi9e/iXFMTqmPiU8FUP5KF8YDv32OnSq0qf7QEmv
 KG/L/QjtIGmkISCsh9e/9dpTbRATSMxzQhJDc+Kpd5tyLqUMV/hK9lW+HnMc6zXlO9Wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VTez6R8bzI6+U9MSF7pS7I+ZvH7q1V51mzcdXTL8nYE=; b=BIOLpy/IOyRqpelKqcvzaI/vw8
 tItapHj8yRdhYIPItEMa5y7W7XY6sqhAbf5yetL+cyabzi6WRMFIIlTEOeyvYki53r8FR342USVtH
 txfZw22CPDKdsaYbE1K+9hU3tYf12OHRXYHEQ17XcXI2bFZOa+qWO2rS4dYWqDwQYFjs=;
Received: from mail-sgaapc01on2108.outbound.protection.outlook.com
 ([40.107.215.108] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjKKD-0006rB-Ab for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 13:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OL2766nTLkUWkRZso7yoxzKh6adrx8RuvDcEDvbpz9o7aR+0Gs0cUzz7+Cmny00HZAqOsDPZMTtQmGj360cwUkpanpmZrSJqHsHK1Atq2WF9De9NeR3AwQpj7c4ggx61a7eihy9O+vmeq/sEsKWpm4AWRfskyveIjfIxL0xXZzRfDxkHb+vPP6xbucOvh13JP9kbPHJgdnxGgG/+/8HgEr0K4BcOesM/T9XdNaPN9jWKIRQNgFL4yp5pSoKfxIcsOLYrdq7nEboyQnwI+QZRms99lQ6gYP9s85szkMaPiXrX69vlv8UemEzHOef5pZV5PzbiCFFgfjcgQnRCNb2OPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTez6R8bzI6+U9MSF7pS7I+ZvH7q1V51mzcdXTL8nYE=;
 b=VjIs7WdohimyzeFoGvaKYcJUtu5k0bzv0iQnPWLG0xoL7NRKRCHiukKChrHNVUOq0mpsZEY2Cu+lPn8JoxO/6FzbzqOR57Qe8hR6Ii+AqQn3/m2rUSpEjs2yhE2aE8eLkIpf8YzV78LQfBTbV0gg/0o4uRmTwR9m/Vq4LXQ6zCsSrdVFMuntpNQq085ROMGZVR7QA3hWx7lDV2hMpqnFKKZAfQH+BzkDFcTOP4Y9YJ8bEqDmf+EwANI8FRM5kayWiTQIeq2Pa7QkMYD6FbzG47nTvU7JUq0HrLDdwLQMwvBTXiyzLjnyNBxE6sZKQM6RKZ2GlLYq/9YQdAavYk2kcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTez6R8bzI6+U9MSF7pS7I+ZvH7q1V51mzcdXTL8nYE=;
 b=V4EtjkaIi15MU0yM6vWqGUPVzdDdhxTLVeKBYHJG9YE0KTSw9J3vLajrk5eg/UHWKJfO7mE9UYUWZ3vx3+aKik04AJWwtLNyV2UUPF4VCNixmY+hkDEEJZGToyWRbe3bZeAVvNQ6shOzq5615IFxv0bPqelycsh6OhUwwHCktql5VnLw1hZfUjOEdSc2tLp6E1I3PCpkhuoD9Krepv039sanxzsxBytamueopqd4V2qVweb2D5g8DaNkN42HYYqCkdHjEO3X38i/IonK+ump2D4sCHyQJpb1D8iROUpWgfD5sWi8zFwLBthpURoUcRQ7xexCoanZTJ2N6+y63KK0Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4995.apcprd06.prod.outlook.com (2603:1096:4:1a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 13:34:09 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6254.028; Mon, 3 Apr 2023
 13:34:09 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Apr 2023 21:33:59 +0800
Message-Id: <20230403133359.6649-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230330162811.18923-1-frank.li@vivo.com>
References: <20230330162811.18923-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: b2595225-8f63-4c8a-ec60-08db34481a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upDTs7fCHEwKaqejgvBz/OIt2NryKn5ThKKzOsvcpksXoImwyOaSm+rfdT3L5A5/agK7/Ue1RAu5zE0iZh2jSghEF1BRCcWi0j3DtZW3WoKK34vGGF8ppRcNsbGt3No/x/Q57SEmWLJL+Rop30awaFkk/vmQPEcOaUepHVtr2LRn8iz1xBmXS+zZS8WcqHZQOnfZ0+MVaYe7OzAt4ckS0l+xMCavcaXWRMDm4vgtKk/nS23Dz6hri/V/y1OtmwejTbNAayg8OhNzx2EiJCZdMd1EVldNnSfG96M4njRvprEHbYl2munonwV7z6RJaa1jjeIjTETwqbATIEjiwD3fLPGilLsSjTZUEi4IJLYFe/pCvS1jbNkI6cmC4bU0FtcNaUN8ghuKOX+St7JCz+uWwQJzp/kA8+dc7lMTjUfvV7h+I4reg5YnVazbxAa1COh/FUBPnHPGmJd06z3QY7ap6ELx3LPeXG/WcVcfpurQPCWNJV+lc+JDIX+pqS+N5yPcIzT+qQyEI+cKlySxd+U2Qrj/OrSc60dMTXtxPov4ErAddmnwAZdRfsPuWdTXb8/3bRNZcE2aHoGC9wxUxfaD3vM+9cF9SV+4rfg6gsPSFmBJCu9VufJk7+kqsk+iXE++
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(66476007)(4326008)(8676002)(66946007)(66556008)(41300700001)(6916009)(478600001)(316002)(8936002)(5660300002)(38100700002)(38350700002)(2616005)(186003)(52116002)(6486002)(6512007)(1076003)(26005)(6506007)(6666004)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pZLRNUp7mRdj7SP0kCBKEl6a1yBXJJUIB+cwZR/mSx+UYepPJ+p6Zz8le4n0?=
 =?us-ascii?Q?TL5WQpUfW8/vrvEMO3QG5CY6MwNvGFzpM7SO5WKqzdZBXOaPw+G5NgsQdo1F?=
 =?us-ascii?Q?nPS6mWJsvwerto1HSJ0MSxy2LVkarSXvICnYt8POH88zfl4QqRgVlUv0K0iU?=
 =?us-ascii?Q?L9uXPC3pz3oFSPFE2UYYddGdm2q8XOgBrXa8h1Ygx6jgqggJz/mA0pOIqy/i?=
 =?us-ascii?Q?RsQZ0XAVebZEQRsUMTLErbhvduHwNdVye9x5bkhwbog5DhXF4ihHA8npoyRz?=
 =?us-ascii?Q?dafv4vX6Mc2CF06izqtnyWEFxvYOnaK9sHSWgMlBx8qGVFzSxAZRojQ8BsQj?=
 =?us-ascii?Q?//j0bgMKqh0r1+DSJFPNvnoymddaV4rtURqkw9ewOIorgcva5wNcWGc5Yrqd?=
 =?us-ascii?Q?BLZgSY0e/cs4c39sg37vgoRidXo97p3DX03Xbz/UOI4iBCaXoHrRnaHvbAbT?=
 =?us-ascii?Q?n/KFe16fHbOBKJjdRWYtbKePWsAci4ENHpxwVhgKICJ7kThqFHNBb/96rtFX?=
 =?us-ascii?Q?68NCJbZQRlhMgz0irfT9izQdOioN7V2l/2a3Hxbn0duO6hpo4PMAV01PODqV?=
 =?us-ascii?Q?f3i1EyJL3eJrRmlLjg/J/fmNlykwScPphp288aHHThf0ybVYYP1PTq4Wc+ZX?=
 =?us-ascii?Q?IioOLkNARFMktXhJ/iIk8Y/UuWLXZv4xF+7kwdkT3yGw/lX2osycKhgzh0KS?=
 =?us-ascii?Q?64oixMxtNMWA+GDldq2Ojt79pKbrgriC1E6F/fpn3Us1g5ljfEhXYYP74XiU?=
 =?us-ascii?Q?6S0wKB6YOnc6s/duCc8iVQePe/16STe9wrdOMzidM0ItwAXGFbnnnbWs5uus?=
 =?us-ascii?Q?9xdB/l4KSiJyJqtHr+uzb9Is1Z0sWCDsYCuqOpftYo3anaU0OfD8XoNisIiP?=
 =?us-ascii?Q?8b/YKgFqyY06E54oSYma0iUDvEVMMt3U2H9aakCpJpnIrXUmzfVNlGvMxTxs?=
 =?us-ascii?Q?CQUvSzMXprRjbnYEma03AGg7cLg6NUgBZDj79B0YzOEhOKuSQqJSjBfn1M3O?=
 =?us-ascii?Q?IFkBobH5Pik+02yzCL8QkZ8KxcbqHOrPFsnCfpenk5E/DRKpCOqf1JX/tG21?=
 =?us-ascii?Q?MSjIcbMWTvZb/X1LCn+FDkgk+6NtSd4tvx6kDlni38LC/lSsS78gGoeGpe+S?=
 =?us-ascii?Q?/DBCdM1x3EF2raN6DsrWw5ThQPJzRU6TZ63EQsWU/G6S0knFV7zJ5C3t/RHT?=
 =?us-ascii?Q?YGrl7jgfluCOQlkqn60PdI65SCEzyxyObr+P817g12IDx4TrnPeIKNewyDmp?=
 =?us-ascii?Q?eLNb9Pmpoy0kUvf4Zn3vCero7g7e/SJtjJ+ttop5nYTLAf359PLi/73JS1c6?=
 =?us-ascii?Q?bfOid4n0lrY1aojSAv8Wb7AdelZhWzPopHckllhx2wLlhQMv+mRz4t0W/M6S?=
 =?us-ascii?Q?l4Hk2EizE/uFbIHjif0mX0MQaebom1cn+CZTT0o1/xez1sg8MHatlhtG3nIE?=
 =?us-ascii?Q?nujT3lsJIrpZum4K3IXYZw7/owk18DNT8b5mWDDPHY2IoSDdZKrCTEWmr2kP?=
 =?us-ascii?Q?cJE3N7rZxWfjPD7+nzp8t3NB15Xkyp71D6/xhko1t8sUWxyILZRP0rHs8xFg?=
 =?us-ascii?Q?XC9pgr6iTDJ3g9u9BV1ZEHeenE298ZW3trgGm5aM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2595225-8f63-4c8a-ec60-08db34481a37
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 13:34:08.7396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmvO3Y1FiD7qVDgN0c5n2Zjkwe18wOHy9x5EZIgB+nlLJsLv5J+PL3da+fgWlTmWDGzKBO64BXz9/gjZ2PmGfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4995
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, > Why not zstd_max_clevel()? zstd_max_clevel() is
 only defined when CONFIG_F2FS_FS_ZSTD is enabled, using zstd_max_clevel()
 will result in compile errors otherwise. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.108 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.108 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pjKKD-0006rB-Ab
Subject: Re: [f2fs-dev] [RESEND] f2fs: add sanity compress level check for
 compressed file
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
Cc: jaegeuk@kernel.org, terrelln@fb.com, linux-kernel@vger.kernel.org,
 frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

> Why not zstd_max_clevel()?

zstd_max_clevel() is only defined when CONFIG_F2FS_FS_ZSTD is enabled,
using zstd_max_clevel() will result in compile errors otherwise.

If using the following code,

----------------------------------------------------------------------------
        switch (ri->i_compress_algorithm) {
        case COMPRESS_LZO:
        case COMPRESS_LZORLE:
                if (compress_level)
                        goto err;
                break;
        case COMPRESS_LZ4:
                if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
                                compress_level > LZ4HC_MAX_CLEVEL)
                        goto err;
                break;
#ifdef CONFIG_F2FS_FS_ZSTD
        case COMPRESS_ZSTD:
                if (!compress_level || compress_level > zstd_max_clevel())
                        goto err;
                break;
#endif
        default:
                goto err;
        }
----------------------------------------------------------------------------

then we will get this result:

	F2FS-fs (loop0): sanity_check_compress_inode: inode (ino=4) has
			unsupported compress level: 0, run fsck to fix

Another way is to use the following code, which ignores the check for
level when CONFIG_F2FS_FS_ZSTD is not enabled.

----------------------------------------------------------------------------
        switch (ri->i_compress_algorithm) {
        case COMPRESS_LZO:
        case COMPRESS_LZORLE:
                if (compress_level)
                        goto err;
                break;
        case COMPRESS_LZ4:
                if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
                                compress_level > LZ4HC_MAX_CLEVEL)
                        goto err;
                break;
        case COMPRESS_ZSTD:
#ifdef CONFIG_F2FS_FS_ZSTD
                if (!compress_level || compress_level > zstd_max_clevel())
                        goto err;
                break;
#else
                return true;
#endif
        default:
                goto err;
        }
----------------------------------------------------------------------------

Perhaps exporting ZSTD_MAX_CLEVEL is a better choice?

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
