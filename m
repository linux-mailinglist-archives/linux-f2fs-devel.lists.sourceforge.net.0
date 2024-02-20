Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5585BF40
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 16:00:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcRb8-0006P4-FM;
	Tue, 20 Feb 2024 14:59:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rcRb7-0006Oy-DT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 14:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mvro3zekXoZ0IqphOQMb6DozUfJPZwilwfAcT3oRVog=; b=LTsHySYNnpN2H4CfIEZlMOtPV3
 SzBqiEB1rvtXLi9R1BmgAlEvrsjIgO/YVuU/QCfAUQ5Z356zI4qzo7FMXHOzfYeKrXbQuMp5/jZKB
 6ZmJ0pvCDvsQJN7ddY14h8W3osHh1u0+v0wpPtmE1q+z2K2LGt+80OeepCzVczu7ulAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mvro3zekXoZ0IqphOQMb6DozUfJPZwilwfAcT3oRVog=; b=gJEBFzVP/gHBZnfb4+BnO80ESt
 U0VlZeqBtIM1v2hNehSl/d9kCzdvfgI45NLak1F+BDgoN+DJWNigt/sWe4jNBel+La80Ku54LgOZB
 dk58UHZYP2/yNLVcktKPSge+iCwM6MZddo2whz2TnADkQgqdxdHoHrFM4V44fvWXngK8=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rcRb4-0000HE-Vs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 14:59:53 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C43111F898;
 Tue, 20 Feb 2024 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708441185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mvro3zekXoZ0IqphOQMb6DozUfJPZwilwfAcT3oRVog=;
 b=1MHaQJL8i7D8jEJnULlFdqwVhl0mVJmTxyTAfnOT33B3Ex2QuFyhxl/cqxfxLO5aYih85i
 7nflvsvX6whA4y8pu7ig/SCRzXkTON+G+OEOHDN11Za0LtUBpvU0LQ742MdGbVvgtkqrnr
 3eOSj79u8cjfnuTj/hh5AQSc4GhghBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708441185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mvro3zekXoZ0IqphOQMb6DozUfJPZwilwfAcT3oRVog=;
 b=KvYwjIm34gjCXKk+/Khnf2ICGcGzqO8Mmy5RtPzBxH3pdVakyzgegMS4uu4Gjt7GLDZfY3
 7/2yo2ZijfeAGtBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708441185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mvro3zekXoZ0IqphOQMb6DozUfJPZwilwfAcT3oRVog=;
 b=1MHaQJL8i7D8jEJnULlFdqwVhl0mVJmTxyTAfnOT33B3Ex2QuFyhxl/cqxfxLO5aYih85i
 7nflvsvX6whA4y8pu7ig/SCRzXkTON+G+OEOHDN11Za0LtUBpvU0LQ742MdGbVvgtkqrnr
 3eOSj79u8cjfnuTj/hh5AQSc4GhghBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708441185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mvro3zekXoZ0IqphOQMb6DozUfJPZwilwfAcT3oRVog=;
 b=KvYwjIm34gjCXKk+/Khnf2ICGcGzqO8Mmy5RtPzBxH3pdVakyzgegMS4uu4Gjt7GLDZfY3
 7/2yo2ZijfeAGtBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FD76139D0;
 Tue, 20 Feb 2024 14:59:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pBv1GGG+1GU4PwAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 20 Feb 2024 14:59:45 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <fb32fc72-5434-4852-b7e9-f63fc03a8248@collabora.com> (Eugen
 Hristev's message of "Tue, 20 Feb 2024 09:36:40 +0200")
Organization: SUSE
References: <20240215042654.359210-1-eugen.hristev@collabora.com>
 <20240215042654.359210-4-eugen.hristev@collabora.com>
 <87zfw0bd6y.fsf@mailhost.krisman.be>
 <50d2afaa-fd7e-4772-ac84-24e8994bfba8@collabora.com>
 <87msrwbj18.fsf@mailhost.krisman.be>
 <fb32fc72-5434-4852-b7e9-f63fc03a8248@collabora.com>
Date: Tue, 20 Feb 2024 09:59:44 -0500
Message-ID: <871q97b2qn.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.90 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-0.80)[84.80%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[14];
 DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.90
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eugen Hristev <eugen.hristev@collabora.com> writes: > Okay, 
 I am changing it. > > By the way,
 is this supposed to work like this on case-insensitive
 directories ? > > user@debian-rockchip-rock5b-rk3588:~$ ls -la
 /media/CI_dir/*cuc > ls: cannot access ' [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcRb4-0000HE-Vs
Subject: Re: [f2fs-dev] [PATCH v10 3/8] libfs: Introduce case-insensitive
 string comparison helper
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> Okay, I am changing it.
>
> By the way, is this supposed to work like this on case-insensitive directories ?
>
> user@debian-rockchip-rock5b-rk3588:~$ ls -la /media/CI_dir/*cuc
> ls: cannot access '/media/CI_dir/*cuc': No such file or directory
> user@debian-rockchip-rock5b-rk3588:~$ ls -la /media/CI_dir/*CUC
> -rw-r--r-- 1 root root 0 Feb 12 17:47 /media/CI_dir/CUC
> user@debian-rockchip-rock5b-rk3588:~$ ls -la /media/CI_dir/cuc
> -rw-r--r-- 1 root root 0 Feb 12 17:47 /media/CI_dir/cuc
> user@debian-rockchip-rock5b-rk3588:~$
>
>
> basically wildcards don't work.

Yes, at least from a kernel point of view.  Your shell does wildcards in
userspace, probably by doing getdents and then comparing with possible
matches.  Since the shell itself is not case-insensitive aware, its
comparison is case-sensitive, and you get these apparent weird
semantics.

Not ideal from a user point of view.  But not a kernel bug.  If it
pushes people away from using case-insensitive directories in their
day-to-day work and leave it to only be used by Windows compatibility
layers, maybe that's a win? :)

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
