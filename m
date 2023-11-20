Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A96627F1989
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Nov 2023 18:15:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r57ry-00062J-W5;
	Mon, 20 Nov 2023 17:15:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1r57ry-00062D-Gj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 17:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JIN3Szij9vng0Sn6tR16Xkp3K/Bfpt8xRLXw989J/84=; b=d3YCa3Gw9lixKf42bOuGEAhRFo
 dn88+n1v+UKtTmAT1kTs7LR3uPCbh4rPwtEe/o+vrDKQyrikgfjZDw5TpUPUDJrDoRV8bZsLYzcTH
 tKk2v0pp5V8xZQUrdQHBfKWdlGlTk37pVoBAbWdc1D3VtPZQjf74Vak3gNyzhy+5+LOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JIN3Szij9vng0Sn6tR16Xkp3K/Bfpt8xRLXw989J/84=; b=GWTlVvRiIhHBLZK5SsBSTJSoXq
 v+rrCKdhOEf+UNCoH33hiTPbiGWPi2cVWRGfuULS1zssa3CDmpoE0bdsPPcP1Y2Qzh70QH+sDKEi0
 6E8IyIVX1OJolZFX4ojJkf3sIqQpkv2f/+cPDPVLpwyb4HU7Q/AawoM4nUF++aX8ISr0=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r57rx-00BGZW-Ut for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 17:15:34 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1AC491F898;
 Mon, 20 Nov 2023 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700499598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JIN3Szij9vng0Sn6tR16Xkp3K/Bfpt8xRLXw989J/84=;
 b=PqcrmX/fFWrnUfu7j8QajdkCGraLIKGobYYF67IGQ9Y3y8vj83MNVxSpcGtzztP0LeXfsx
 PsoU8Go3KoGMpG7KNfxG3PUmzDEzL/YeqZkLwmQo6UrYQ0FGPwBfRrPjv/firN7mibcXNC
 FvBuhe9HNSvRSP8YnZ4o6zQqbMh5mhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700499598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JIN3Szij9vng0Sn6tR16Xkp3K/Bfpt8xRLXw989J/84=;
 b=SbImRmN2wQzPTGfC64qqBKeQ3LvGvkLeHhLvv1WqkCjE8ccSwUdroTzQkEP5temN/x4G9Q
 jqF26BCAftTuwmDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC44B13499;
 Mon, 20 Nov 2023 16:59:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fqoQMI2QW2VOAQAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 20 Nov 2023 16:59:57 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Christian Brauner <brauner@kernel.org>
In-Reply-To: <20231120-nihilismus-verehren-f2b932b799e0@brauner> (Christian
 Brauner's message of "Mon, 20 Nov 2023 16:06:09 +0100")
Organization: SUSE
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
Date: Mon, 20 Nov 2023 11:59:56 -0500
Message-ID: <87il5w5pir.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.07
X-Spamd-Result: default: False [-2.07 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.17)[-0.859]; RCPT_COUNT_SEVEN(0.00)[9];
 INVALID_MSGID(1.70)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christian Brauner <brauner@kernel.org> writes: > On Sun, Nov
 19, 2023 at 06:11:39PM -0500, Gabriel Krisman Bertazi wrote: >> Christian
 Brauner <brauner@kernel.org> writes: >> >> > On Wed, 16 Aug 2023 01:07:54
 -0400, Gabriel Krisman Bertazi wrote: [...] 
 Content analysis details:   (-1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.2 INVALID_MSGID          Message-Id is not valid, according to RFC 2822
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r57rx-00BGZW-Ut
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christian Brauner <brauner@kernel.org> writes:

> On Sun, Nov 19, 2023 at 06:11:39PM -0500, Gabriel Krisman Bertazi wrote:
>> Christian Brauner <brauner@kernel.org> writes:
>> 
>> > On Wed, 16 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi wrote:
>> >> This is v6 of the negative dentry on case-insensitive directories.
>> >> Thanks Eric for the review of the last iteration.  This version
>> >> drops the patch to expose the helper to check casefolding directories,
>> >> since it is not necessary in ecryptfs and it might be going away.  It
>> >> also addresses some documentation details, fix a build bot error and
>> >> simplifies the commit messages.  See the changelog in each patch for
>> >> more details.
>> >> 
>> >> [...]
>> >
>> > Ok, let's put it into -next so it sees some testing.
>> > So it's too late for v6.7. Seems we forgot about this series.
>> > Sorry about that.
>> 
>> Christian,
>> 
>> We are approaching -rc2 and, until last Friday, it didn't shown up in
>> linux-next. So, to avoid turning a 6 month delay into 9 months, I pushed
>> your signed tag to linux-next myself.
>> 
>> That obviously uncovered a merge conflict: in v6.6, ceph added fscrypt,
>> and the caller had to be updated.  I fixed it and pushed again to
>> linux-next to get more testing.
>> 
>> Now, I don't want to send it to Linus myself. This is 100% VFS/FS code,
>> I'm not the maintainer and it will definitely raise eyebrows.  Can you
>> please requeue and make sure it goes through this time?  I'm happy to
>
> My current understanding is that core dcache stuff is usually handled by
> Al. And he's got a dcache branches sitting in his tree.
>
> So this isn't me ignoring you in any way. My hands are tied and so I
> can't sort this out for you easily.

Please don't take it personally, but you surely see how frustrating this
is.

While I appreciate your very prompt answer, this is very different from:

  https://lore.kernel.org/linux-fsdevel/20230821-derart-serienweise-3506611e576d@brauner/
  https://lore.kernel.org/linux-fsdevel/20230822-denkmal-operette-f16d8bd815fc@brauner/
  https://lore.kernel.org/linux-fsdevel/20231025-selektiert-leibarzt-5d0070d85d93@brauner/

Perhaps it all has a vfs-specific meaning. But the following suggests it
was accepted and queued long ago:

> Thanks! We're a bit too late for v6.6 with this given that this hasn't
> even been in -next. So this will be up for v6.7.
[...]
> Ok, let's put it into -next so it sees some testing.
[...]
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied.
[...]
> Patches in the vfs.casefold branch should appear in linux-next soon.
[...]

Obviously, there are big issues with the process here. But I fail to see
how I could have communicated clearer or where I didn't follow the
process in this entire thread.

The branches you mentioned are 10 days old. This patchset was
"accepted" two months ago.

As one of the VFS maintainer, can you send an acked-by - or at least a
r-b in cases like this, if you agree with the patches?  Then it makes
more sense for me to send to Linus directly.

Viro,

You are CC'ed since early 2022.  Can you comment?  Ted and Eric
reviewed, Christian too.  there's been only small changes since the
first RFC.

I'll ask Linus to pull from the unicode tree in the next merge window
if I don't hear from you.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
