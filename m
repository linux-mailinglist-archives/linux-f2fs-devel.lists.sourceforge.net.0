Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508FA83838
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 07:24:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2kOr-00059h-LL;
	Thu, 10 Apr 2025 05:24:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1u2kOq-00059V-Fq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 05:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oy2xwhkt36abwai6kbHaZstisArtgjMDxYMe+h1l/2E=; b=AouoK7/J/zN3DfGFwBxnyU1ctA
 l46qiSmFCfcm1CsVZxw8LrT+Ha4UwfdPlkX8bRN7ILVp+OZBIlEdUHGn0CFZw7B2AmBXYD+Zv4Hpk
 sjGWGzfTxcyTLnR2BDfIJCUNGe6TEAtGg9SGQk/icFrmA81ngVPR9qItFrV5go4yEHKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oy2xwhkt36abwai6kbHaZstisArtgjMDxYMe+h1l/2E=; b=LYaC/d6sgyy4Z7COYaiEfDijTD
 rI9dqPQBSLpDI3vzyXIF/aRjJq2XSRiDd/8gxoGCK2uszuTXVy6pCEox9Vcb59B8kgU2S9EV5w0JK
 iea84GyiigfwrzyRgqsqkT/4fO1ELYQgE16uKcOvWN2KpGujdUt4488oqHrrkf66w/xw=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u2kOa-0006lz-3A for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 05:24:29 +0000
X-AuditID: a67dfc59-057ff7000000aab6-35-67f755f181ca
From: "yohan.joung" <yohan.joung@sk.com>
To: "yohan.joung" <yohan.joung@sk.com>
Date: Thu, 10 Apr 2025 14:23:37 +0900
Message-ID: <20250410052347.1928-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250410051244.1870-1-yohan.joung@sk.com> (raw)
References: 
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXC9ZZnoe7H0O/pBsdWsltcWuRucXnXHDYH
 Jo/dCz4zeXzeJBfAFMVlk5Kak1mWWqRvl8CVcf5YB1PBM/mKix3XmRsYT0h0MXJySAiYSPx6
 2MAOY8/dsIIRxGYT0JD409vLDGKLCKhJLH/5HijOxcEs0MwocWHeFhaQhLBAnsT0hyfBilgE
 VCVe7L0AFucVMJPYeu02K8RQTYkdX84zgdicArYSGw4tBIsLCfBIvNqwnxGiXlDi5MwnYL3M
 AvISzVtnM4MskxB4yCrRMOUn1CBJiYMrbrBMYOSfhaRnFpKeBYxMqxhFMvPKchMzc4z1irMz
 KvMyK/SS83M3MQJDbFntn8gdjN8uBB9iFOBgVOLh9cj4li7EmlhWXJl7iFGCg1lJhNfT8Hu6
 EG9KYmVValF+fFFpTmrxIUZpDhYlcV6jb+UpQgLpiSWp2ampBalFMFkmDk6pBsZKqa01t2M+
 zLB9bB0hWPYn36Z3/QOFqHfXl397EwD0d1jxhYkN/h/zhaNt42aeDg8sWrLEr/JI/m324uhA
 rXf7/ISbWaaJHlrIOKemR//ZzxW9vgZxohs1Wit3iTAHpF/mr70gp5CwJIYhTsVy9/xdPXoR
 FoZXUg+z7Fq9026BbaHYKqnbSizFGYmGWsxFxYkA9kDRCC0CAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmluLIzCtJLcpLzFFi42LhmqEyR/dj6Pd0g/a/jBaXFrlbXN41h81i
 wtyrTBbvt95jdGDx2L3gM5PHt9seHp83yQUwR3HZpKTmZJalFunbJXBlnD/WwVTwTL7iYsd1
 5gbGExJdjJwcEgImEnM3rGAEsdkENCT+9PYyg9giAmoSy1++B4pzcTALNDNKXJi3hQUkISyQ
 JzH94UmwIhYBVYkXey+AxXkFzCS2XrvNCjFUU2LHl/NMIDangK3EhkMLweJCAjwSrzbsZ4So
 F5Q4OfMJWC+zgLxE89bZzBMYeWYhSc1CklrAyLSKUSQzryw3MTPHTK84O6MyL7NCLzk/dxMj
 MGiW1f6ZtIPx22X3Q4wCHIxKPLweGd/ShVgTy4orcw8xSnAwK4nwehp+TxfiTUmsrEotyo8v
 Ks1JLT7EKM3BoiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpgTDERdeCa/DwncC97vYII98S4
 PwwfX+4Mulcsvd1NvKazJ/TU/bVJJ9vO2DddbXpvssI5aBvf823SqxJO3bZPcE2U75/TIc26
 S2HvLuHLQvWmu6LmX5LJmK97+ZJOSLeHyJ85beHav4QKPHfd/Cqq4vlHVFkhIy09qUHpVrdG
 xXe/LFURR1YlluKMREMt5qLiRAB2UMbXFgIAAA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu,
 10 Apr 2025 14:12:39 +0900 [thread overview] "yohan.joung"
 <yohan.joung@sk.com> wrote: > On Thu, 10 Apr 2025 03:53:07 +0000 [thread
 overview] Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TO_EQ_FM_DIRECT_MX     To == From and direct-to-MX
X-Headers-End: 1u2kOa-0006lz-3A
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: prevent the current section from
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 10 Apr 2025 14:12:39 +0900	[thread overview] "yohan.joung" <yohan.joung@sk.com> wrote:
> On Thu, 10 Apr 2025 03:53:07 +0000	[thread overview] Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net> wrote:
> > On 04/07, Chao Yu wrote:
> > > On 4/7/25 10:08, Chao Yu wrote:
> > > > On 4/5/25 03:55, Jaegeuk Kim wrote:
> > > >> Hi Yohan,
> > > >>
> > > >> I modified this patch after applying the clean up by
> > > >>
> > > >> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
> > > >>
> > > >> --- a/fs/f2fs/segment.h
> > > >> +++ b/fs/f2fs/segment.h
> > > >> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> > > >>
> > > >>         free_i->free_sections++;
> > > >>
> > > >> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> > > >> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> > > >> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> > > >> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> > > > 
> > > > Reviewed-by: Chao Yu <chao@kernel.org>
> > > 
> > > Oh, can we add Fixes line to make it to be merged into stable kernel?
> > 
> > Which one would be good to add?
> jaegeuk, please apply the patch above
> Thanks
sorry it is correct to apply the one below.
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > >> +
> > > >>  unlock_out:
> > > >>         spin_unlock(&free_i->segmap_lock);
> > > >>  }
> > > >>
> > > >> On 04/04, yohan.joung wrote:
> > > >>> When selecting a victim using next_victim_seg in a large section, the
> > > >>> selected section might already have been cleared and designated as the
> > > >>> new current section, making it actively in use.
> > > >>> This behavior causes inconsistency between the SIT and SSA.
> > > >>>
> > > >>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> > > >>> Call trace:
> > > >>> dump_backtrace+0xe8/0x10c
> > > >>> show_stack+0x18/0x28
> > > >>> dump_stack_lvl+0x50/0x6c
> > > >>> dump_stack+0x18/0x28
> > > >>> f2fs_stop_checkpoint+0x1c/0x3c
> > > >>> do_garbage_collect+0x41c/0x271c
> > > >>> f2fs_gc+0x27c/0x828
> > > >>> gc_thread_func+0x290/0x88c
> > > >>> kthread+0x11c/0x164
> > > >>> ret_from_fork+0x10/0x20
> > > >>>
> > > >>> issue scenario
> > > >>> segs_per_sec=2
> > > >>> - seg#0 and seg#1 are all dirty
> > > >>> - all valid blocks are removed in seg#1
> > > >>> - gc select this sec and next_victim_seg=seg#0
> > > >>> - migrate seg#0, next_victim_seg=seg#1
> > > >>> - checkpoint -> sec(seg#0, seg#1)  becomes free
> > > >>> - allocator assigns sec(seg#0, seg#1) to curseg
> > > >>> - gc tries to migrate seg#1
> > > >>>
> > > >>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> > > >>> Signed-off-by: Chao Yu <chao@kernel.org>
> > > >>> ---
> > > >>>  fs/f2fs/segment.h | 9 ++++++++-
> > > >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > > >>> index 0465dc00b349..0773283babfa 100644
> > > >>> --- a/fs/f2fs/segment.h
> > > >>> +++ b/fs/f2fs/segment.h
> > > >>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> > > >>>  		next = find_next_bit(free_i->free_segmap,
> > > >>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
> > > >>>  		if (next >= start_segno + usable_segs) {
> > > >>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
> > > >>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
> > > >>>  				free_i->free_sections++;
> > > >>> +
> > > >>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> > > >>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> > > >>> +
> > > >>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> > > >>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> > > >>> +			}
> > > >>>  		}
> > > >>>  	}
> > > >>>  skip_free:
> > > >>> -- 
> > > >>> 2.33.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
