Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C0511C27
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njk8T-00070i-5r; Wed, 27 Apr 2022 16:03:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1njk8Q-0006zf-KM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jd72J8M0neFFhUOwxsHNzjGfA1o+HHRAGh31eMkc+aw=; b=eKFA0h4WWas14g9Dkq5wqa9b6X
 rC04hgn1YJAeqzPj/8JHHkhqHqSqS7N7WYbR7HYQbrIbAT+sbaZgMmj1BAo6K7B96wvzRmPdlxH9L
 tkNBR49vRGYQVqTVCZnWNXd7tpLZs6wbaasdS6Gs4OqjoMV1B6r3GjcbINRt6bQj1xws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jd72J8M0neFFhUOwxsHNzjGfA1o+HHRAGh31eMkc+aw=; b=TtV0g/1284yewXaGcB8dGpc8Im
 Oiro0JlCdZVh3t60udosEwpedlHIQ/RFnrOX08yn/YYPiCeWOzxRGL2lRBPau68IMW8VCxqXh41T5
 Ivwm3I9qtW3geWV23IiBGLFeECHQfjbAjmCO9e1aUImVZ4UEYY4OGLdzCvfgcWFGtL40=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njk8O-00Bt5H-8v
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 16:03:20 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160314euoutp01538f5a7acb236c72a488c35c289e5ac6~pzFK3AKu20746107461euoutp01w
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:03:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220427160314euoutp01538f5a7acb236c72a488c35c289e5ac6~pzFK3AKu20746107461euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651075394;
 bh=jd72J8M0neFFhUOwxsHNzjGfA1o+HHRAGh31eMkc+aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q920AbObxfqW9FIerFZcnqN7I6yNd1imxWw7I+M8TEElhoIfb2iG6fm8wdi+HJExu
 ucaVVJdYgZuLkMfK+gZBm4pGde8yRGeFjrNm3O2oxsTvlUpP4pK4kVFqIzK/w2qZN4
 J9JJMizDk9uU1BXHuBLCYOPDBnV3EBIHkO+bqeGk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160312eucas1p287fed8f498db8495d7a0e270dbca8ab1~pzFJXt9m32337223372eucas1p28;
 Wed, 27 Apr 2022 16:03:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C8.14.09887.04969626; Wed, 27
 Apr 2022 17:03:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746~pzFJABirU0627806278eucas1p2D;
 Wed, 27 Apr 2022 16:03:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220427160312eusmtrp1554db7f7acd8df39fab8ccb76d9490ec~pzFI-Cgfl2077420774eusmtrp1d;
 Wed, 27 Apr 2022 16:03:12 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-6b-62696940e55b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6C.A7.09404.F3969626; Wed, 27
 Apr 2022 17:03:11 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160311eusmtip2e43e337671f79300cb30594cd877a901~pzFIsidNe2538025380eusmtip2Q;
 Wed, 27 Apr 2022 16:03:11 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:54 +0200
Message-Id: <20220427160255.300418-16-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxTee+/t7aWm5FJEXmCb0MkiMEDZou8CYywjcjf4sfhjIW7GFbkC
 o0VoQTdMNgRk0jBoMUgpDNGNiaAWBMn4qCuED1lt6ujK+NgYxjYqc4C2bKsgWcvtNv895znP
 c55zkkPhok4ymMrJK2TleRKpmBQQvWMuc3RSTk7GrtNrAUj3wxiOOn6tIdHZFReOjHUmDNXW
 aPhozWTGkX6pkYdu/30SQzOGPgxd6hjFkE2nxVGVYYVAT5Xzbq78Do7W7+xGtcNTANmtWgzp
 Z6PQ5N02Ppq8kIIG9RMEsvQ3kejct3Y+UlWs4mhaZQdIPd7NQ47Wcj66+vsygW7OhiS9wFh+
 SmU2bl4mGXXZEp8xz3cRjMVUxFxrrySZ8yV1ONP9zefMQIsDYwZmSkjmy7Ilkuk79RuPWb5h
 JZnqnnbA6HqsBKPq7uK9JzogSMhkpTnHWHls4keCbIezGctfoD5Zt3RjJUDDVwIfCtKvQdPG
 VzwlEFAiug1A+5VLBFc4AVzve4xzhQNAx+zqf5bZqTaMa1wEsHRoAXDFAwBHTz1yD6Moko6E
 Jyv5Hn4rPQ2gurNz04HTizi83fMz5hnlT78LR75f2MQEHQ6t5QbSg4V0PLzcYAVc3HbYMPkX
 3zPUx82rHqdzEj840WAjPBh3S8quN26uCulWAWy4v8rjvMnQMTfixf5wcbzHe8Lz0HimiuDw
 CWifXvOaywGs6dORnjDoDqu+JfVAnI6Auv5YTv4WrKhpxjiFL5z+w49bwRfW9tbjHC2EpytE
 nFoM+1w2byiEltImbygDDSYjrgJh2meO0T5zjPb/3BaAt4NAtkghy2IVcXns8RiFRKYoysuK
 OXxUdg24n9q4Me78DlxcfBQzDDAKDANI4eKtQudAdoZImCn5tJiVHz0kL5KyimEQQhHiQOHh
 nE6JiM6SFLK5LJvPyv/tYpRPcAlWkF66uvMz+szcvGjKyCQ3HtGUmaz6d7b51qdGKIJ0gbqn
 X4QayWNpg3EpuS+qQ6Mzqj72s11Zzm/GI4fSfqxre3tf70KtWqoueBivHBne38Wr3jfgan0u
 S99d6BuWmLDi089Ll+z8RRV3bstxc0Js8FBSbvbDqHjNanE4L7TukN3f+STi4LaAfPNMyI6B
 1/d+3bW/uoJ69ZUO/fbrBwruwrWW+JnUgPsHQ5Rjqht/try854QwaC94I2+Ly+X34b2ypkyZ
 6Wpg4g6obwqLvmWrPBtZbKocfT895cl88pJ/5p4P4mVBb0bNHkkzMAsvEZK5MG24OnEEDT6o
 v9ei26Up1U+ICUW2ZHckLldI/gEmqmc5QwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0wbdRzfPXp3kGBuBbOz07g0QxOMBy2F/crmMBvYmyRqpkEyZ7bCLqVZ
 H9iHcWbTAlVH2aTUTUeHW6nDQJlFRjGUDiRNx8OF4KhlrCiwQGVCwmMghRXQdmiy/z6v7+OP
 D4Fwr3J4hFylYzUqqYKPxaO3N3vHXs6WywvTugNZoPmXHgQ0/VGFga8X1hBw++IADCxVl3AQ
 GRhEQOfcZQ74dbUUBve63TBobLoFg6lmKwLOdS+gYMM0FtWM9xGwfl8ALN5hCIQCVhh0Bl8C
 Q5MNOBiyS8DNzn4U+DtqMXD1+xAOzJ//jYARcwgC1b2tHLBUb8SBc3YeBX3Bna8+x/h/y2M2
 +65jTHX5HM4MjrWgjH9Az9xwVGBMneEiwrRe+5Tx2JZgxnPPgDHny+cwxv3ZOIeZ7wpgzJcu
 B8Q0uwIoY25t4bzFPULv06j1OnZXsVqre4X/ngAIaYEY0EKRmBak73k/S5jBT92/7wSrkH/I
 alL3H6eLl5avwCUTxEfr/lbYAF3CTVAcQZEiKjjcAJugeIJL1kPUSMCKbhkUNVpXBm3hRGp9
 2IRthaYh6vzD2ighCIxMoUor8JieRE5B1PjaJBojCGlAqWB1BxybTiRfp3w/TzzGKJlMBYzd
 WAwnkHup6zWB/y48T9UMhfHY0riobn5YEJO5ZBZVaQ9ytuLbqf6aqcfPIdF4edtlxAyR1ics
 6xOWDYIdUBKr1yplSq2Q1kqVWr1KRheplTegaFN+6llztUONM4u0F4IJyAtRBMJPSlj2FBdy
 E05IT33MatTHNHoFq/VCGdG3qxHe00XqaNVUumOCzLQMgShTnJYhzkzn70g4VHJWyiVlUh17
 kmVLWM3/czARxzPAZ+05myblmVzLiqD/SFVu6sY7rj3PuJYVi55ZRUGf2mP+Qd9eMatjtvEi
 Xy0eAhLblI1ePeVh8t+cgc2EM0/y2mnxG6cnPT63qO1B4ODOHqf8UY6zKO+piG7VeLj0QO4H
 e4saZJ27scbCFhN7lHO3IGKf9l2xVW778+Taixu5vXfqk3cL372Z80V4tExcsNDlvzA/uOJT
 ybYHb9Xhlk/Ibx51hUqc6ZWJK+ObKflJ+sMtevdB+4Mfuc+29YRnhqxHLWHjXyOjv8ddM8SH
 Jh3nVBNN/Gzam+2byREt71jcJU6W5Kvdx/+5Y3jhu7LpFd63dyUyx9sHIu1n/OHaDiMf1RZL
 BSmIRiv9F9LcNg2yAwAA
X-CMS-MailID: 20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746
X-Msg-Generator: CA
X-RootMTR: 20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746@eucas1p2.samsung.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Luis Chamberlain <mcgrof@kernel.org> F2FS zoned support
 has power of 2 zone size assumption in many places such as in
 __f2fs_issue_discard_zone, 
 init_blkz_info. As the power of 2 requirement has been removed from the block
 layer, explici [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njk8O-00Bt5H-8v
Subject: [f2fs-dev] [PATCH 15/16] f2fs: ensure only power of 2 zone sizes
 are allowed
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
Cc: jiangbo.365@bytedance.com, Pankaj Raghav <p.raghav@samsung.com>,
 kch@nvidia.com, bvanassche@acm.org, matias.bjorling@wdc.com,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Luis Chamberlain <mcgrof@kernel.org>

F2FS zoned support has power of 2 zone size assumption in many places
such as in __f2fs_issue_discard_zone, init_blkz_info. As the power of 2
requirement has been removed from the block layer, explicitly add a
condition in f2fs to allow only power of 2 zone size devices.

This condition will be relaxed once those calculation based on power of
2 is made generic.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 fs/f2fs/super.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f64761a15df7..db79abf30002 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3685,6 +3685,10 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 		return 0;
 
 	zone_sectors = bdev_zone_sectors(bdev);
+	if (!is_power_of_2(zone_sectors)) {
+		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
+		return -EINVAL;
+	}
 
 	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
 				SECTOR_TO_BLOCK(zone_sectors))
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
