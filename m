Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185D257405
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 09:00:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCdnK-00073u-7A; Mon, 31 Aug 2020 06:59:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kCdnI-00073a-QC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 06:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=saH70UpwkKhZJqtIzAmxtDvYezf4ZMHIvzRgs9oJ0eY=; b=ftufsmtZ+ykvuGuTTWb471blmi
 dQIl5RowtAB/UW+XOvxeTt/BaWcpHIj1D0Yr9jBm4LXiMw7IEBh3HEDhR8RtDu++6Ykt6F63RyprB
 M4/V9wJKXXi2L0ZXAsJB1eNmgARBSae+m5tkeT+BFal/3DhTnhYCiCmYGD0mQNeyIi6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=saH70UpwkKhZJqtIzAmxtDvYezf4ZMHIvzRgs9oJ0eY=; b=alc30uvqYoDcBBLHM0yrwkvigO
 mzw5t6OkApzcNK+QbeAhtju8YjqvaljehCJ7YkWb7/qDVO+O+YRoom4J9DQhdoa/8UCWUvsGcMg+7
 WbDWxFivB4A2p7/9QNDSCRFiKlUZEkwsqM5lZurlZAFUgTRfSnIMEVldRI0ZMitSS97o=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCdnA-00ASDH-9J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 06:59:56 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 83A81744CE870CABDBC1;
 Mon, 31 Aug 2020 14:59:28 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 31 Aug
 2020 14:59:27 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200804131449.50517-1-yuchao0@huawei.com>
 <20200804131449.50517-6-yuchao0@huawei.com>
 <20200825193404.GA2614120@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7986af8c-1fe9-7140-f1c0-d8b4a58f702c@huawei.com>
Date: Mon, 31 Aug 2020 14:59:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200825193404.GA2614120@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
 0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCdnA-00ASDH-9J
Subject: Re: [f2fs-dev] [PATCH v2 5/5] f2fs: support age threshold based
 garbage collection
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

I've changed code a bit to fix some bugs, including:
- gc_idle = 3 (GC_IDLE_AT) description
- disallow set gc_idle to 3 if atgc is off
- keep compatibility with checkpoint disabling

Could you please check and merge below diff?

From: Chao Yu <yuchao0@huawei.com>

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
  Documentation/ABI/testing/sysfs-fs-f2fs |  3 ++-
  fs/f2fs/gc.c                            | 12 +++++++++++-
  fs/f2fs/sysfs.c                         | 11 ++++++++---
  3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 7f730c4c8df2..834d0becae6d 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -22,7 +22,8 @@ Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
  Description:	Controls the victim selection policy for garbage collection.
  		Setting gc_idle = 0(default) will disable this option. Setting
  		gc_idle = 1 will select the Cost Benefit approach & setting
-		gc_idle = 2 will select the greedy approach.
+		gc_idle = 2 will select the greedy approach & setting
+		gc_idle = 3 will select the age-threshold based approach.

  What:		/sys/fs/f2fs/<disk>/reclaim_segments
  Date:		October 2013
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6413886e52d4..3c0edb8b4cc5 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -388,6 +388,16 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
  	unsigned long long mtime = 0;
  	unsigned int i;

+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
+		if (p->gc_mode == GC_AT &&
+			get_valid_blocks(sbi, segno, true) == 0)
+			return;
+
+		if (p->alloc_mode == AT_SSR &&
+			get_seg_entry(sbi, segno)->ckpt_valid_blocks == 0)
+			return;
+	}
+
  	for (i = 0; i < sbi->segs_per_sec; i++)
  		mtime += get_seg_entry(sbi, start + i)->mtime;
  	mtime = div_u64(mtime, sbi->segs_per_sec);
@@ -721,7 +731,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
  		/* Don't touch checkpointed data */
  		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
  					get_ckpt_valid_blocks(sbi, segno) &&
-					p.alloc_mode != SSR))
+					p.alloc_mode == LFS))
  			goto next;
  		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
  			goto next;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 88ed9969cc86..bacfa9c35e6b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -375,12 +375,17 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
  		return count;
  	}
  	if (!strcmp(a->attr.name, "gc_idle")) {
-		if (t == GC_IDLE_CB)
+		if (t == GC_IDLE_CB) {
  			sbi->gc_mode = GC_IDLE_CB;
-		else if (t == GC_IDLE_GREEDY)
+		} else if (t == GC_IDLE_GREEDY) {
  			sbi->gc_mode = GC_IDLE_GREEDY;
-		else
+		} else if (t == GC_IDLE_AT) {
+			if (!sbi->am.atgc_enabled)
+				return -EINVAL;
+			sbi->gc_mode = GC_AT;
+		} else {
  			sbi->gc_mode = GC_NORMAL;
+		}
  		return count;
  	}

-- 
2.26.2




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
