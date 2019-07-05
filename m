Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16160501
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jul 2019 13:04:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hjM0X-00012r-6Z; Fri, 05 Jul 2019 11:04:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hjM0V-00012j-KX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jul 2019 11:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZRYstN8JQNmVEZr9D6nl/dAhfTacyROCEQUAvnrm5iM=; b=MZ+P5kdvBejD+42BkDwvTVBZFb
 yRACJPizoyasjMzBMa9axB6xpNLt8wvwQudXmhWvVCIfYKCnUBJtYX1W56bd9N7F8WmuxtEXRdsKm
 JCR40Llfysy8WTaVj/WxMroLXGmEVc1XB/RmfnYn/Se72jsQWzM2avxR7q2UsjvdRW4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZRYstN8JQNmVEZr9D6nl/dAhfTacyROCEQUAvnrm5iM=; b=RSOfSvj/HBtv3k9TBNtjDYPxqf
 MHxGC+yTMBLToNNOkgpBj49Oy2cE0M0H5Aak/jn81acy487haUecoK5dxEyohflfyjLgaoAGab4M5
 dNNjdQyHOpUchOFecelH/gExHwa6BhRx9mQQX9o0s5ZbRgtJFucYN02EoP0WM9s9SBlE=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hjM0e-008p9Z-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jul 2019 11:04:10 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id C53D360A63; Fri,  5 Jul 2019 11:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1562324642;
 bh=Uz3g9h/4CO1t2AihmZ7dQn/1aQYAjbJiSZ9rDut/+M0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eiwsqe5yOUxe4sBJX/VqC69Rd4zeCCO5bYYt/YWm56r4SRFYMvO7s72wSP8igFXxS
 3eU0pYgofnVy0yfb8eio4PQgg4K/i5B2J9L+vnbTn13prXgasjMjttkMIpA3w4lYvC
 rAGNudTlsNkVdP1rj3/lBwcs1RF11CApFnA6zOys=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A8C56016D;
 Fri,  5 Jul 2019 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1562324641;
 bh=Uz3g9h/4CO1t2AihmZ7dQn/1aQYAjbJiSZ9rDut/+M0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HDku3zqkD2vkQWnt07GWudbu9AbhJKhwe9WLjflVzcutT3IRnAjJHso6Tnh00rHIM
 d2+yhHcykqUhgsk/2p+GILirLYOQfKywGY5A/pO3IZdqtSZ2NFHP63auVumvuwgSSR
 UJq63sD2BiBctlhl3ablSEqJ6rz0ppD8FJKV27kI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A8C56016D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Fri, 5 Jul 2019 16:33:57 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190705110356.GC8289@codeaurora.org>
References: <1562302863-14418-1-git-send-email-stummala@codeaurora.org>
 <15bb7741-7c2f-8dc2-065f-ba1fcaf22050@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15bb7741-7c2f-8dc2-065f-ba1fcaf22050@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hjM0e-008p9Z-Ay
Subject: Re: [f2fs-dev] [PATCH] fsck: Fix data loss issue observed during SPO
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Fri, Jul 05, 2019 at 06:11:47PM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2019/7/5 13:01, Sahitya Tummala wrote:
> > With the commit <979b25727800> ("fsck.f2fs: check validity of nat journal"),
> > there is a serious data loss issue observed during sudden power off tests.
> 
> In that patch, since journal's data is untrusty, I just truncated n_nats to last
> valid one to fix original reported issue.

The original issue will be fixed even without updating/truncating the n_nats
as we still have sanity checks on nid and blkaddr, right?

> 
> Actually, the problem here is we don't know which data is correct and which data
> is corrupted in nat or sit journal, so even we skip broken entry without
> modifying journal->n_{nats,sits}, latter entry may still contain broken data(but
> it may pass validation check), and those entries may cause potential data
> loss/corruption...
> 

This issue was reported by a customer in the following test scenario -

Update the password in Android and then force crash. It is verified that
all the files related to password data has fsync() already.

After some iterations (3-4) of this test, it is found password related files are
lost, failing the phone to bootup.

Without this patch ("fsck.f2fs: check validity of nat journal"), they don't see
such issue. It means that the data present in journal seems to be valid atleast
in this case and truncating is causing to loose the valid data/files.

> It looks no matter how we change the codes, we still may face data
> loos/corruption issues.
> 

Yes, maybe in some cases, the data loss is still expected, but there are
chances that data may be valid as well, which is confirmed by the test case above.

> IMO, we need to find out the root cause of data corruption, So my question is
> that why sudden power off tests can make nat journal being corrupted? I doubt
> that in-place update method on checkpoint area of fsck may cause this... any
> other thoughts?
> 

In case of sudden power off, I have printed the all the journal entries in the
NAT and I several entries with valid blkaddr and nid as below -

[   21.007649] fsck.f2fs: withfix: 0: addr 1c373 nid 45b\x0a
[   21.014399] fsck.f2fs: withfix: 1: addr 1c2c1 nid 1b5\x0a
[   21.021151] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 2/37 is invalid!!!\x0a
[   21.030860] fsck.f2fs: withfix: 3: addr 1c1f7 nid 19b2\x0a
[   21.037674] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 4/37 is invalid!!!\x0a
[   21.047353] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 5/37 is invalid!!!\x0a
[   21.057062] fsck.f2fs: withfix: 6: addr 1c377 nid ac3\x0a
[   21.063841] fsck.f2fs: withfix: 7: addr 1c378 nid ac9\x0a
[   21.070634] fsck.f2fs: withfix: 8: addr 1b2fe nid 807\x0a
[   21.077356] fsck.f2fs: withfix: 9: addr 17aeb nid 805\x0a
[   21.084102] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 10/37 is invalid!!!\x0a
[   21.093891] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 11/37 is invalid!!!\x0a
[   21.103662] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 12/37 is invalid!!!\x0a
[   21.113450] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 13/37 is invalid!!!\x0a
[   21.123227] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 14/37 is invalid!!!\x0a
[   21.133022] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 15/37 is invalid!!!\x0a
[   21.142792] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 16/37 is invalid!!!\x0a
[   21.152580] fsck.f2fs: withfix: 17: addr 1c37f nid ff4\x0a
[   21.159415] fsck.f2fs: withfix: 18: addr 1c36c nid ff9\x0a
[   21.166229] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 19/37 is invalid!!!\x0a
[   21.176039] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 20/37 is invalid!!!\x0a
[   21.185831] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 21/37 is invalid!!!\x0a
[   21.195631] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 22/37 is invalid!!!\x0a
[   21.205394] fsck.f2fs: withfix: 23: addr 1c2f3 nid 61c\x0a
[   21.212257] fsck.f2fs: withfix: 24: addr 1c391 nid 641\x0a
[   21.219093] fsck.f2fs: withfix: 25: addr 1c386 nid 33b\x0a
[   21.225905] fsck.f2fs: withfix: 26: addr 1c356 nid 258\x0a
[   21.232767] fsck.f2fs: withfix: 27: addr 1c2f2 nid 382\x0a
[   21.239601] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 28/37 is invalid!!!\x0a
[   21.249398] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 29/37 is invalid!!!\x0a
[   21.259160] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 30/37 is invalid!!!\x0a
[   21.268970] fsck.f2fs: withfix: 31: addr 1ac03 nid 1ccd\x0a
[   21.275874] fsck.f2fs: withfix: 32: addr 1c395 nid a57\x0a
[   21.282709] fsck.f2fs: withfix: 33: addr 1c392 nid 92e\x0a
[   21.289564] fsck.f2fs: withfix: 34: addr 1c38b nid aa1\x0a
[   21.296377] fsck.f2fs: withfix: 35: addr 1c393 nid 931\x0a
[   21.303240] fsck.f2fs: withfix: 36: addr 1c394 nid a35\x0a

Thanks,

> Thanks,
> 
> > 
> > The reason is due to incorrect update of journal->n_nats in that patch.
> > When fsck encounters a nat journal entry with invalid blkaddr/nid, it
> > updates journal->n_nats with the index of such first entry and then continues
> > the for loop which scans all nats in journal in f2fs_init_nid_bitmap().
> > But that loop doesn't continue and doesn't update nm_i->nid_bitmap as well,
> > as it fails the for loop condition i < nats_in_cursum(journal).
> > 
> > There could be several other valid entries in the journal after this
> > invalid entry. Due to this invalid journal->n_nats, build_nat_area_bitmap()
> > could not be build properly for valid nat journal entries. It further results
> > into these fsck asserts/errors and causes data loss due to incorrect fsck fix.
> > 
> > [ASSERT] (sanity_check_nid: 372)  --> nid[0xfb01] ino is 0\x0a
> > [FIX] (__chk_dentries:1438)  --> Unlink [0xfb01] - _JeNcl242yB3Apz2MW,VOh6WmjsVht1W len[0x1c], type[0x1]\x0a
> > [ASSERT] (sanity_check_nid: 372)  --> nid[0xfa2d] ino is 0\x0a
> > [FIX] (__chk_dentries:1438)  --> Unlink [0xfa2d] - _++vN7axccjjGNI,TQEVmcOemY1EAAAA len[0x14], type[0x1]\x0a
> > ...
> > NID[0xba5] is unreachable\x0a
> > NID[0xfa9] is unreachable\x0a
> > ...
> > [FIX] (nullify_nat_entry:2089)  --> Remove nid [0xba5] in NAT\x0a
> > [FIX] (nullify_nat_entry:2089)  --> Remove nid [0xfa9] in NAT\x0a
> > ...
> > 
> > Fixes: 979b25727800 ("fsck.f2fs: check validity of nat journal")
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> >  fsck/mount.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/fsck/mount.c b/fsck/mount.c
> > index 60e0e4a..1b93f49 100644
> > --- a/fsck/mount.c
> > +++ b/fsck/mount.c
> > @@ -1160,7 +1160,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
> >  		addr = le32_to_cpu(nat_in_journal(journal, i).block_addr);
> >  		if (!IS_VALID_BLK_ADDR(sbi, addr)) {
> >  			MSG(0, "\tError: f2fs_init_nid_bitmap: addr(%u) is invalid!!!\n", addr);
> > -			journal->n_nats = cpu_to_le16(i);
> >  			c.fix_on = 1;
> >  			continue;
> >  		}
> > @@ -1168,7 +1167,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
> >  		nid = le32_to_cpu(nid_in_journal(journal, i));
> >  		if (!IS_VALID_NID(sbi, nid)) {
> >  			MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
> > -			journal->n_nats = cpu_to_le16(i);
> >  			c.fix_on = 1;
> >  			continue;
> >  		}
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
