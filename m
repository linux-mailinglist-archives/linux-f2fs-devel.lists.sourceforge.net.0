Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E318D565B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 May 2024 01:39:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCpMs-00051S-Ft;
	Thu, 30 May 2024 23:39:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sCpMq-00051J-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 May 2024 23:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wtc/uyMXfTTlvQhUJU/LTmJ2k2q88/6icrnT4zna3/I=; b=cuMAkAxE4v9F8iJVjFLS9HeFe1
 FW8Z7ong1CvhBcvMDIh+Mo3fq1mMTEE1oetl6/yE/ghc/NCFi75aIqJX0sWvGq3WU1lOUiCYS7poM
 Fuy8l9yKEXbAg91FBq+UEGClwm0jZrPyuX0SIZGgbC0/XUmxm5/hLiR7cEcoMi06GaCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wtc/uyMXfTTlvQhUJU/LTmJ2k2q88/6icrnT4zna3/I=; b=cAzs1qVHG0wks8n/j2IX2myfHs
 DVYZDywFUbuZJh7pqBJNJqztGciol0kVZYRzhIqtLDriBtFQqC4Mq1OOows4gVP0yd0hmPZrWPRwB
 G6huQK+v7aweo3wq1ECQd8rWnqgKA/dDAb+JN3TWs8xQSVYAkctWDsZfFCGINGqWIHxk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCpMq-0005n8-VA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 May 2024 23:39:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D5D54628CA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 May 2024 23:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62815C2BBFC;
 Thu, 30 May 2024 23:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717112366;
 bh=sVv/oR9gef/2s1T5b+tAfBDYtP0ALpovcy0y5xS7bFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dh2h9nBdEwLpAg8aiHA6n8oZ6P6LUJMFVKCYqrLXQWgduD7reb0Gijcw9JZCkd2qP
 rxs8aGaOz/W4rCfZCtSPkkUqKYNmTlGqAeA53+UAU/w+TG0RTS8QUqvfz1nLYVLVPH
 KYqHTIpOvKbuM7SmpWlKrL2sujfBXTXXpuiOLxInJwdOk5IVLL2HocfBkb2R/e3J20
 Qa8Jp+UpKVh8yT8N5cNE0GwYAQochQ/X7rpyLI97UemOW6xl+gdhgUWtA7f75PgQwE
 tqaVyZk5fbQn+QSLqJ28S+GqMJQINd0bQzwjLuVUUtoSjV3fwpPC7HfA0DLY0urqGo
 NBCRNTIQwTRvg==
Date: Thu, 30 May 2024 23:39:24 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZlkOLN0BugwQ2p5p@google.com>
References: <20240411082354.1691820-1-chao@kernel.org>
 <11d5d736-bae5-4a71-b400-087b8722893c@kernel.org>
 <03647897-8b1f-4c82-b2b6-0aa0704bed05@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03647897-8b1f-4c82-b2b6-0aa0704bed05@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/29, Chao Yu wrote: > Ping, Chao, sorry, I might need
 some time to take a look at the change cautiously. > > On 2024/4/23 10:07,
 Chao Yu wrote: > > Jaegeuk, any comments for this serials? > > > > On 2024/4/11
 16:23, Chao Yu wrote: > > > After commit 899fee36fac0 ("f2fs: fix to avoid
 data corruption by > [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCpMq-0005n8-VA
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use per-log target_bitmap to
 improve lookup performace of ssr allocation
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/29, Chao Yu wrote:
> Ping,

Chao, sorry, I might need some time to take a look at the change cautiously.

> =

> On 2024/4/23 10:07, Chao Yu wrote:
> > Jaegeuk, any comments for this serials?
> > =

> > On 2024/4/11 16:23, Chao Yu wrote:
> > > After commit 899fee36fac0 ("f2fs: fix to avoid data corruption by
> > > forbidding SSR overwrite"), valid block bitmap of current openned
> > > segment is fixed, let's introduce a per-log bitmap instead of temp
> > > bitmap to avoid unnecessary calculation overhead whenever allocating
> > > free slot w/ SSR allocator.
> > > =

> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > > v2:
> > > - rebase to last dev-test branch.
> > > =A0 fs/f2fs/segment.c | 30 ++++++++++++++++++++++--------
> > > =A0 fs/f2fs/segment.h |=A0 1 +
> > > =A0 2 files changed, 23 insertions(+), 8 deletions(-)
> > > =

> > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > index 6474b7338e81..af716925db19 100644
> > > --- a/fs/f2fs/segment.c
> > > +++ b/fs/f2fs/segment.c
> > > @@ -2840,31 +2840,39 @@ static int new_curseg(struct f2fs_sb_info *sb=
i, int type, bool new_sec)
> > > =A0=A0=A0=A0=A0 return 0;
> > > =A0 }
> > > -static int __next_free_blkoff(struct f2fs_sb_info *sbi,
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int segno,=
 block_t start)
> > > +static void __get_segment_bitmap(struct f2fs_sb_info *sbi,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned l=
ong *target_map,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int segno)
> > > =A0 {
> > > =A0=A0=A0=A0=A0 struct seg_entry *se =3D get_seg_entry(sbi, segno);
> > > =A0=A0=A0=A0=A0 int entries =3D SIT_VBLOCK_MAP_SIZE / sizeof(unsigned=
 long);
> > > -=A0=A0=A0 unsigned long *target_map =3D SIT_I(sbi)->tmp_map;
> > > =A0=A0=A0=A0=A0 unsigned long *ckpt_map =3D (unsigned long *)se->ckpt=
_valid_map;
> > > =A0=A0=A0=A0=A0 unsigned long *cur_map =3D (unsigned long *)se->cur_v=
alid_map;
> > > =A0=A0=A0=A0=A0 int i;
> > > =A0=A0=A0=A0=A0 for (i =3D 0; i < entries; i++)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 target_map[i] =3D ckpt_map[i] | cur_map[i=
];
> > > +}
> > > +
> > > +static int __next_free_blkoff(struct f2fs_sb_info *sbi, unsigned lon=
g *bitmap,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int segno,=
 block_t start)
> > > +{
> > > +=A0=A0=A0 __get_segment_bitmap(sbi, bitmap, segno);
> > > -=A0=A0=A0 return __find_rev_next_zero_bit(target_map, BLKS_PER_SEG(s=
bi), start);
> > > +=A0=A0=A0 return __find_rev_next_zero_bit(bitmap, BLKS_PER_SEG(sbi),=
 start);
> > > =A0 }
> > > =A0 static int f2fs_find_next_ssr_block(struct f2fs_sb_info *sbi,
> > > -=A0=A0=A0=A0=A0=A0=A0 struct curseg_info *seg)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct cur=
seg_info *seg)
> > > =A0 {
> > > -=A0=A0=A0 return __next_free_blkoff(sbi, seg->segno, seg->next_blkof=
f + 1);
> > > +=A0=A0=A0 return __find_rev_next_zero_bit(seg->target_map,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BLKS_PER_SEG(sbi), seg=
->next_blkoff + 1);
> > > =A0 }
> > > =A0 bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int seg=
no)
> > > =A0 {
> > > -=A0=A0=A0 return __next_free_blkoff(sbi, segno, 0) < BLKS_PER_SEG(sb=
i);
> > > +=A0=A0=A0 return __next_free_blkoff(sbi, SIT_I(sbi)->tmp_map, segno,=
 0) <
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 BLKS_PER_SEG(sbi);
> > > =A0 }
> > > =A0 /*
> > > @@ -2890,7 +2898,8 @@ static int change_curseg(struct f2fs_sb_info *s=
bi, int type)
> > > =A0=A0=A0=A0=A0 reset_curseg(sbi, type, 1);
> > > =A0=A0=A0=A0=A0 curseg->alloc_type =3D SSR;
> > > -=A0=A0=A0 curseg->next_blkoff =3D __next_free_blkoff(sbi, curseg->se=
gno, 0);
> > > +=A0=A0=A0 curseg->next_blkoff =3D __next_free_blkoff(sbi, curseg->ta=
rget_map,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 curseg->segno, 0);
> > > =A0=A0=A0=A0=A0 sum_page =3D f2fs_get_sum_page(sbi, new_segno);
> > > =A0=A0=A0=A0=A0 if (IS_ERR(sum_page)) {
> > > @@ -4635,6 +4644,10 @@ static int build_curseg(struct f2fs_sb_info *s=
bi)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sizeof(struct f2f=
s_journal), GFP_KERNEL);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!array[i].journal)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
> > > +=A0=A0=A0=A0=A0=A0=A0 array[i].target_map =3D f2fs_kzalloc(sbi, SIT_=
VBLOCK_MAP_SIZE,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 GFP_KERNEL);
> > > +=A0=A0=A0=A0=A0=A0=A0 if (!array[i].target_map)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (i < NR_PERSISTENT_LOG)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 array[i].seg_type =3D CURSEG_=
HOT_DATA + i;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 else if (i =3D=3D CURSEG_COLD_DATA_PINNED)
> > > @@ -5453,6 +5466,7 @@ static void destroy_curseg(struct f2fs_sb_info =
*sbi)
> > > =A0=A0=A0=A0=A0 for (i =3D 0; i < NR_CURSEG_TYPE; i++) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(array[i].sum_blk);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(array[i].journal);
> > > +=A0=A0=A0=A0=A0=A0=A0 kfree(array[i].target_map);
> > > =A0=A0=A0=A0=A0 }
> > > =A0=A0=A0=A0=A0 kfree(array);
> > > =A0 }
> > > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > > index e1c0f418aa11..10f3e44f036f 100644
> > > --- a/fs/f2fs/segment.h
> > > +++ b/fs/f2fs/segment.h
> > > @@ -292,6 +292,7 @@ struct curseg_info {
> > > =A0=A0=A0=A0=A0 struct f2fs_summary_block *sum_blk;=A0=A0=A0 /* cache=
d summary block */
> > > =A0=A0=A0=A0=A0 struct rw_semaphore journal_rwsem;=A0=A0=A0 /* protec=
t journal area */
> > > =A0=A0=A0=A0=A0 struct f2fs_journal *journal;=A0=A0=A0=A0=A0=A0=A0 /*=
 cached journal info */
> > > +=A0=A0=A0 unsigned long *target_map;=A0=A0=A0=A0=A0=A0=A0 /* bitmap =
for SSR allocator */
> > > =A0=A0=A0=A0=A0 unsigned char alloc_type;=A0=A0=A0=A0=A0=A0=A0 /* cur=
rent allocation type */
> > > =A0=A0=A0=A0=A0 unsigned short seg_type;=A0=A0=A0=A0=A0=A0=A0 /* segm=
ent type like CURSEG_XXX_TYPE */
> > > =A0=A0=A0=A0=A0 unsigned int segno;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/* current segment number */
> > =

> > =

> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
