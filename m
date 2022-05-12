Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782952424B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 04:04:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1noyCB-0003rA-PB; Thu, 12 May 2022 02:04:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1noyBt-0003qp-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 02:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+JD5aj7nqwkMXCaBE0pPC8G0SjuK/JOrCpDreizuic=; b=Rwmd61BELbsgH3bnmpHtlLHuQ4
 T0PbzlFD8g0Gh2/Zgh4+ZEr9lFNZJN+g9JYawsM8dmNR+Zn2XGbhxsBhru+SCoGgUde3XH6epC1M3
 hvN9kSzlHPfvcBEc02rVNrctF3P0elEODuwsKcs1C+rskjJ89kGTvVCKabPVT/DIgiuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K+JD5aj7nqwkMXCaBE0pPC8G0SjuK/JOrCpDreizuic=; b=ivv+Xzmvbr7R04HYgRgkl1ZUY8
 pAbEACJlLEMSUS/liuFijCI6nMnUAsfic4jZwyWcSOVjlL4tXGYh7hlXWPzk3TyEVIOe7ktFyfM9g
 0kFKILgGDaEpHecyXcdpWQ4LKQykpJrKhA/K9NyvDecMBzej1L6dvi3OIkLmLvHOxSM4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noyBm-00078y-9M
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 02:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9831ECE0AD2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 May 2022 02:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5154CC340EE;
 Thu, 12 May 2022 02:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652321045;
 bh=Wud9ZjEwcU5I2fkae6/vF+vlYg7dBuM3CqHBWPGLhc0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D4zOOI8NdqlXQXE3TicnihYvWwIQMf4jp+7RWrZbjVOj2aH+VQghK+NKn1QO0ypnt
 jAY4YV0CuZPDmhv+2gqT35MZ1erNz09DlNSsYVfTfB57RJ9Vlcnr/UkyG3AT8Q/dLO
 6RD8IhJR4kF/11P3IIC9wxg/njSPK8VHlMD2OjsSCkRJHlvPvkwaQvFVPjiPze88Da
 KqOGJ+xVkqRgWODyGk1QaTBVVFcnpQxoXDsLRjA3E1m8LvuCiKNT4or+L37tkMw0Vx
 ATr+HThX4wvg9JjSb3fDqCEGcGes2pR4fzOWk4yjC73lmHThO4e7OZmXtohlWFFebk
 vlAIo/Vu0yk9g==
Message-ID: <ab569309-f639-33af-ebb3-909a02158d02@kernel.org>
Date: Thu, 12 May 2022 10:04:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-4-jaegeuk@kernel.org>
 <77e870dd-fd7a-f58e-79fb-d0e5b8fbfc16@kernel.org>
 <YnlHdgHix+3qlc1a@google.com>
 <42c23c83-1914-e8dd-c765-df3d6d872532@kernel.org>
 <Ynvoszmp7+64NdZg@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Ynvoszmp7+64NdZg@google.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/12 0:47, Jaegeuk Kim wrote: >>>>> @@ -147, 6 +147,
 7
 @@ static int gc_thread_func(void *data) >>>>> gc_control.init_gc_type =
 sync_mode ? FG_GC : BG_GC; >>>>> gc_control.no_bg_gc = foreground; [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1noyBm-00078y-9M
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: do not stop GC when requiring a
 free section
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

On 2022/5/12 0:47, Jaegeuk Kim wrote:
>>>>> @@ -147,6 +147,7 @@ static int gc_thread_func(void *data)
>>>>>     		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
>>>>>     		gc_control.no_bg_gc = foreground;
>>>>> +		gc_control.nr_free_secs = foreground ? 1 : 0;

[snip]

> 
> I mean gc_control->nr_free_secs should be 0.

[snip]

>>>>> @@ -528,7 +528,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>>>>>     				.init_gc_type = BG_GC,
>>>>>     				.no_bg_gc = true,
>>>>>     				.should_migrate_blocks = false,
>>>>> -				.err_gc_skipped = false };
>>>>> +				.err_gc_skipped = false,
>>>>> +				.nr_free_secs = 1 };

Oh, so, in above two paths, when .nr_free_secs is 1, no_bg_gc should be true
to keep skipping BG_GC flow.

How about adding a check condition in f2fs_gc() to avoid invalid argument
usage in future?

From: Chao Yu <chao@kernel.org>

---
  fs/f2fs/gc.c | 17 +++++++++++++----
  1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 385282017317..a98276fd3cc1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1799,10 +1799,19 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
  			gc_type = FG_GC;
  	}

-	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
-	if (gc_type == BG_GC && gc_control->no_bg_gc) {
-		ret = -EINVAL;
-		goto stop;
+	if (gc_type == BG_GC) {
+		/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
+		if (gc_control->no_bg_gc) {
+			ret = -EINVAL;
+			goto stop;
+		}
+		/*
+		 * BG_GC never guarantee that blocks are migrated synchronously.
+		 */
+		if (gc_control->nr_free_secs) {
+			ret = -EINVAL;
+			goto stop;
+		}
  	}
  retry:
  	ret = __get_victim(sbi, &segno, gc_type);
-- 
2.25.1



Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
