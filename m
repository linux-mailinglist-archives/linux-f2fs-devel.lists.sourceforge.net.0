Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50BA875EA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Apr 2025 04:51:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u49vD-0001kD-Jk;
	Mon, 14 Apr 2025 02:51:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u49vC-0001k7-QJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 02:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U5MiaLSUCKnyl8UMa7l3GK40KfRC1au4MJoSwKbCSVE=; b=AcTLFNlIyZjbrVoEoG7T2+epIH
 KIQ/lrRxTdsLwMxqV9DqbGSGZrSzRCzgnjUuMuY0oQXGD8dzJtWoi44gGZBCjKNITByzxQPxXPapF
 el4ustdm8mKxGn91EmFzsVuas4g/wd/LOPOs3v7SoOoftuogZzUoIgQdAnkeK5JrpRQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U5MiaLSUCKnyl8UMa7l3GK40KfRC1au4MJoSwKbCSVE=; b=SuPfEx73bBL5Osh7Dt9+PQxUiu
 uvFFQUt9nfPg88ZqXSxP+F8Oh0BvnmohehkcxDw/4mErmTE+5oX6CbjUsMZsLgCH7uyGHoHqmX66t
 fm5BqgXXJb+rr/RbpmLYvIr6HWiZtNeRy0ijJt8ZXoskianheJV4Pjcvzif6WfIkqQX8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u49uw-0000uw-Hp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 02:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 31CCA434F7;
 Mon, 14 Apr 2025 02:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7572C4CEE7;
 Mon, 14 Apr 2025 02:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744599081;
 bh=Wj3S8KedIPKd8qLpsYGUPYHaHfBJnSalkguXKdKXMes=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Xe3+1Jz0d0gBVui2ehILxJAejM0rUBQdRky3c1uuzGTvVCesS4zNBTORGOGV4yVp8
 1a2qwv0v7aOT2h3pWaeQISEt/WPU58dlkJUKjhKUeIUSU9mLQ+w0wQAIJFMDSoTSBE
 0u/HInJfAnb5HQOBMSBjivAbxRqeeqVSD7lV2DZXbA+ubSyFgqspaJnqNJtVR/08HO
 eXJzZ/LNgQX1UN835biUkpnhcto/5yGSVXRLAp0TWgUvSzyPWrpdMnLBJe7pZBwXP8
 a9xAwMZg5DWbMF+U6vST6DTDoyqHLVAZUNQO1QR+4Jb5Ac8RRExoxjqBmM6reZd61z
 kfzSBh+SrEWmg==
Message-ID: <f4d666d0-519c-4b74-9625-79e1f9d32859@kernel.org>
Date: Mon, 14 Apr 2025 10:51:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: uplinkr@airmail.cc
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
 <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
 <80e1ae8eddff0536f09ca07e802fb983@airmail.cc>
 <46507541-7e11-435e-b57a-7ed945ddc182@kernel.org>
 <CAD14+f06qKLefutNfLFRC4ZbJ2wcn0r1TL3Qx95B14u-XokyZQ@mail.gmail.com>
 <99dee2ef-d325-47bd-ae6e-c2af15fa6121@kernel.org>
 <e1a6b5ee756d5f3adb5e83bfd0db42ad@airmail.cc>
Content-Language: en-US
In-Reply-To: <e1a6b5ee756d5f3adb5e83bfd0db42ad@airmail.cc>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/11/25 23:49, uplinkr@airmail.cc wrote: > Hello everyone,
 > > I'm sorry to not have anything constructive to add, but I'm about as
 flabbergasted as I could be. I retraced all my steps (exactly as [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u49uw-0000uw-Hp
Subject: Re: [f2fs-dev] Resize metadata corruption
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/11/25 23:49, uplinkr@airmail.cc wrote:
> Hello everyone,
> 
> I'm sorry to not have anything constructive to add, but I'm about as flabbergasted as I could be. I retraced all my steps (exactly as I went through with them before!) and was unable to replicate the
> corruption. On the contrary, the filesystem grew completely as expected.

Hi uplinkr,

Thanks a lot for helping to reproduce this bug.

> 
> After restoring my partition and backing it up, I ran fsck on it. fsck reported no issues with the data, so I pressed on. I opened up GParted and expanded it like last time. This time, however, I
> didn't end up with no "Mount unclean image to replay log" error, and the resize went through as expected. The partition mounted perfectly well, and when I ran fsck, it too reported no corruption.
> 
> I recall that the "Mount unclean image to replay log" error was present through reboots and live ISOs. Perhaps that's the culprit?

	if (c.func != FSCK && c.func != DUMP && c.func != INJECT &&
		!is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG)) {
		ERR_MSG("Mount unclean image to replay log first\n");
		return -1;
	}

If we run resize on an uncleaned image (suffer sudden power cut), it will
reports "Mount unclean image to replay log first" message, once you mount
this image, and umount it normally, then we can run resize on it successfully.

So I doubt it's not the key point of resize bug, one thing I suspect more
is space usage, as Juhyung reported:

"One thing to note here is that he said that the utilization was very
full: only 8G left. Maybe this is the corner case that we need to look
out for?"

Maybe, we can try resizing w/ almost fully used image to check whether
there is any corner case we missed to handle.

Please let me know, if you find more special status of your data.

Thanks,

> 
> Thanks, sincerely.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
