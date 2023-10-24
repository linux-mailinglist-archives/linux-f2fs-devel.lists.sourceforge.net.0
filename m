Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDCF7D5DFD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Oct 2023 00:20:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qvPlO-0003jI-Ar;
	Tue, 24 Oct 2023 22:20:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qvPlJ-0003jB-To
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Oct 2023 22:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CDeMMzqwERdWZxhGUFthQI91/gdqCAMKlu74LJU3/pc=; b=IF38lyMSXtvgkuhCzyEEo1QQDf
 8n4l9DyTMicm2Ff2VdluvpVcEc8uT2cOqwCcYYGCfTLJKOswWzMnDLogX0eDaG5DJuto6cdQBHqtg
 iZbNb2tmfxF2s+eqncFsOC1/VL3wqV31mwMi3uoHSxCHtfGIiBN6IN065wfx3kXOnF7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CDeMMzqwERdWZxhGUFthQI91/gdqCAMKlu74LJU3/pc=; b=OOJ/MQJzX0jps+YGgpl4Xboe2K
 9pcAqP62xNbrfWzxar4/NXc9YibCDGHUIJ9hoEkYad3gMhYN45OzQOnxbN3tmKEIBh+sPRaBe3Dqi
 xeBTLFoLjbze2/MASPCyhH6VWrDFmm3sIrkXgG+XajS5x3FAVs0nN+WD2vi3jb00zjb4=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qvPlH-008J0G-Fq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Oct 2023 22:20:32 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 23F4521C7F;
 Tue, 24 Oct 2023 22:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698186021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDeMMzqwERdWZxhGUFthQI91/gdqCAMKlu74LJU3/pc=;
 b=vBRHjWs+sgfl44CHFZ67PsaMWBbaUhtaEl5ETVD8Y0K0pcxZYwDcyKDSfVQ+0AXfiwf7pX
 tysZQkyaSTF165wNCkKoDUQBOtlPwXih0BBfQtH07RNP67rRqBicWF1gZnzlWiC5ftYa0z
 BGq4v9yZKpo3MpVDdjtrgn+w8gH7ox0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698186021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDeMMzqwERdWZxhGUFthQI91/gdqCAMKlu74LJU3/pc=;
 b=933tbh9jJpH40D8bAgtuwIP3Oz7cqUkB+n7n5/w3vxtF14VC633YCAUySmXy/JoYWnrKhe
 85Ty07IujwoJWGBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E23631391C;
 Tue, 24 Oct 2023 22:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4vKlMSRDOGXYBgAAMHmgww
 (envelope-from <krisman@suse.de>); Tue, 24 Oct 2023 22:20:20 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Christian Brauner <brauner@kernel.org>
In-Reply-To: <20230822-denkmal-operette-f16d8bd815fc@brauner> (Christian
 Brauner's message of "Tue, 22 Aug 2023 11:03:48 +0200")
Organization: SUSE
References: <20230816050803.15660-1-krisman@suse.de>
 <20230817170658.GD1483@sol.localdomain>
 <20230821-derart-serienweise-3506611e576d@brauner>
 <871qfwns61.fsf@suse.de>
 <20230822-denkmal-operette-f16d8bd815fc@brauner>
Date: Tue, 24 Oct 2023 18:20:19 -0400
Message-ID: <87pm138xy4.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.78
X-Spamd-Result: default: False [-3.78 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-3.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 INVALID_MSGID(1.70)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-1.88)[94.35%]
X-Spam-Flag: NO
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Christian Brauner <brauner@kernel.org> writes: >> Targeting
 6.7 is fine by me. will you pick it up through the vfs tree? I >> prefer
 it goes through there since it mostly touches vfs. > > Yes, I think that's
 what will end up happening. 
 Content analysis details:   (-1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.2 INVALID_MSGID          Message-Id is not valid, according to RFC 2822
X-Headers-End: 1qvPlH-008J0G-Fq
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christian Brauner <brauner@kernel.org> writes:

>> Targeting 6.7 is fine by me. will you pick it up through the vfs tree? I
>> prefer it goes through there since it mostly touches vfs.
>
> Yes, I think that's what will end up happening.

Hi Christian,

Sorry for the ping again, but I got a question about your process.

I noticed this patchset did not make into linux-next in preparation for
the 6.7 merge request. It also doesn't show in your vfs.all, but an
older iteration (definitely not the v6 that Eric acked) exists in a
vfs.dcache.casefold branch.  Is this expected and I'm missing something?

I considered this applied but I might have misunderstood. Please let me
know if you need me to rebase.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
