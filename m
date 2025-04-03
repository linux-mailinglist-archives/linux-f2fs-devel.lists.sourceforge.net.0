Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B03A79C7B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Apr 2025 09:02:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0Eb3-0000Iw-4N;
	Thu, 03 Apr 2025 07:02:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1u0Eak-0000Id-Fd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 07:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7x/OuKT5YP0A/jMBGcu0n73Vc58WKxvsJ6frg2aNW/A=; b=MYD20qB2fnmZW4t1z3VwYkJKnz
 sIjsCFUnzpQ/TMyWjaUVQa5oJrzKFgjLE2rNCwb6liFa/Q8EbOUGUnhEP7lUWqlZXIVDMm7SDptvp
 kxdpkrl0zyXm9YHvD/UKED3et56CKe4Zb47nCk2RhSo40QUtYl4hVWFYUO7x1PR+PtQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7x/OuKT5YP0A/jMBGcu0n73Vc58WKxvsJ6frg2aNW/A=; b=h0wpa+JR3nYMS4keBrJvMWPl46
 6O7xI3J6ZJiUDbpwId5MoXWgrUCc3OqI1guoCPnsZdSa2G6nhTGBaGFj2S6srHOS4xVC2zmL9aC4C
 0GswsaPoYNtyAOvD47X1ZNW1P9lYcuJErmi8X7RG1WiJ3+htJTmsrtz4WOaSVuwbsKEQ=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u0EaT-0005OS-Kb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 07:02:22 +0000
X-AuditID: a67dfc59-03fff7000000aab6-42-67ee3261a423
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  3 Apr 2025 16:01:51 +0900
Message-ID: <20250403070151.2894-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <002ea626-8468-4587-b481-10d8b9bd7a0f@kernel.org>
References: <002ea626-8468-4587-b481-10d8b9bd7a0f@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsXC9ZZnkW6i0bt0g31H1C1OTz3LZPFk/Sxm
 i0uL3C0u75rD5sDisWlVJ5vH7gWfmTw+b5ILYI7isklJzcksSy3St0vgymidcIGp4IJoxfqj
 f5kbGC8LdjFycEgImEh8bU6DMd8diu9i5ORgE9CQ+NPbywxiiwhoSUxs+MsIYjMLlEr0Pl8G
 ZgsL5EmcOnSdCcRmEVCV+HB8O5jNK2AmcbTlEguILSGgKbHjy3mwOKeAncSHYwfBeoUEbCWu
 dDaxQNQLSpyc+YQFYr68RPPW2UB7uYB6v7JKTLn1gAlikKTEwRU3WCYw8s9C0jMLSc8CRqZV
 jCKZeWW5iZk5xnrF2RmVeZkVesn5uZsYgaG3rPZP5A7GbxeCDzEKcDAq8fB2XHubLsSaWFZc
 mXuIUYKDWUmEt1ALKMSbklhZlVqUH19UmpNafIhRmoNFSZzX6Ft5ipBAemJJanZqakFqEUyW
 iYNTqoGxZPn1cp6IzSI/Xmgpveu2KH7OZPlO1dH852rHDdO92+sl2+7LtdcpsBzzkZToblrw
 /M9Ts/9CafV7ErekpT+caeDj1qydf45RIMP9VOLeUK9H7LGyKxpKn8xWMuLdqvHoxdzjddUl
 G345tx5cpV6t7iG0I1ZGudHSbdu5G4s23z/51Tp9AZcSS3FGoqEWc1FxIgBUN6phOQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsXCNUNljm6i0bt0g9efxC1OTz3LZPFk/Sxm
 i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
 t0vgymidcIGp4IJoxfqjf5kbGC8LdjFycEgImEi8OxTfxcjJwSagIfGnt5cZxBYR0JKY2PCX
 EcRmFiiV6H2+DMwWFsiTOHXoOhOIzSKgKvHh+HYwm1fATOJoyyUWEFtCQFNix5fzYHFOATuJ
 D8cOgvUKCdhKXOlsYoGoF5Q4OfMJC8R8eYnmrbOZJzDyzEKSmoUktYCRaRWjSGZeWW5iZo6Z
 XnF2RmVeZoVecn7uJkZgOC2r/TNpB+O3y+6HGAU4GJV4eC+YvE0XYk0sK67MPcQowcGsJMJb
 qAUU4k1JrKxKLcqPLyrNSS0+xCjNwaIkzusVnpogJJCeWJKanZpakFoEk2Xi4JRqYLT8uuud
 YOi0D6sTJuk7pUk+5vZoe3jt/6nYLnaPRo/fy9J9Hbq+HFyqmPFLmX/GxO1ms5NuzLuyQmz2
 z4kX5zNOq/i8VaPz85LXz7NYFS/GbdlcdvePl/6vQrnrHT1sq8xYqiTjOmVu7XxWy/MjUkZH
 M+/Wnuiq7VvOi6gvWP3O4sJNl0InNRUlluKMREMt5qLiRABvm3ajIwIAAA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu,
 3 Apr 2025 14:26:59 +0800 Chao Yu via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net> wrote: > On 2025/4/2 16:04,
 yohan.joung
 wrote: > > When selecting a victim using next_victim_seg [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1u0EaT-0005OS-Kb
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: prevent the current section from
 being selected as a victim during GC
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 3 Apr 2025 14:26:59 +0800 Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net> wrote:
> On 2025/4/2 16:04, yohan.joung wrote:
> > When selecting a victim using next_victim_seg in a large section, the
> > selected section might already have been cleared and designated as the
> > new current section, making it actively in use.
> > This behavior causes inconsistency between the SIT and SSA.
> > 
> > F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> > Call trace:
> > dump_backtrace+0xe8/0x10c
> > show_stack+0x18/0x28
> > dump_stack_lvl+0x50/0x6c
> > dump_stack+0x18/0x28
> > f2fs_stop_checkpoint+0x1c/0x3c
> > do_garbage_collect+0x41c/0x271c
> > f2fs_gc+0x27c/0x828
> > gc_thread_func+0x290/0x88c
> > kthread+0x11c/0x164
> > ret_from_fork+0x10/0x20
> > 
> > issue scenario
> > segs_per_sec=2
> > - seg#0 and seg#1 are all dirty
> > - all valid blocks are removed in seg#1
> > - gc select this sec and next_victim_seg=seg#0
> > - migrate seg#0, next_victim_seg=seg#1
> > - checkpoint -> sec(seg#0, seg#1)  becomes free
> > - allocator assigns sec(seg#0, seg#1) to curseg
> > - gc tries to migrate seg#1
> > 
> > Signed-off-by: yohan.joung <yohan.joung@sk.com>
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> >   fs/f2fs/segment.h | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index 0465dc00b349..129df633d656 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -476,6 +476,12 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >   		if (next >= start_segno + usable_segs) {
> >   			if (test_and_clear_bit(secno, free_i->free_secmap))
> >   				free_i->free_sections++;
> > +
> > +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
> > +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> > +
> > +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
> > +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> 
> Only need to reset next_victim_seg[] when setting section free?
Ah, I missed that. I'll put up the patch again right away.
Thanks. 
> 
> if (!test_and_clear_bit(secno, free_i->free_secmap))
> 	goto skip_free;
> 
> free_i->free_sections++;
> 
> if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
> 	sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
> 	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> 
> Thanks,
> 
> >   		}
> >   	}
> >   skip_free:
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
