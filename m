Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F18B81D40C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Dec 2023 13:47:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rH1PH-0007Rg-M7;
	Sat, 23 Dec 2023 12:47:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rH1PG-0007Ra-C0
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Dec 2023 12:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eq6uZ1zPaOibUmv5NcqUrkQEVjzEQzNYsVkUK9LIluQ=; b=Aj3gJ9dqfC8qMLBGgII/eygXog
 s1y5DIbB3P+UShkCe70u5lCbjPEaQzhGEk09wS7IaVUHhCMQD2ohn1H8KfqzoeFwIOwjl29GCgnK2
 pzVcAAns+UHptEr/fxihSseE1p+wccf7SFjoPClBU8mc+kv4u1i7DJqt/czQbtyvsFQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Eq6uZ1zPaOibUmv5NcqUrkQEVjzEQzNYsVkUK9LIluQ=; b=QZ+UL7Oz6yZ5/Z1ygzDB9HjcKC
 cVpwLx+2UGSTXbulZCO1YjSTUbt8IUoqPt7iOTRmCJjmHQ0HV6/D18i7JH1LhoS9LzsmmXVvZd0X/
 fy3AI8XFcmlegwu4JHwiCwitJv5v6sG/LO5C1OpJyZuPoKAvieIG4rW6+hZqNNPd8ZlI=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rH1PC-0007Q6-91 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Dec 2023 12:47:06 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B7051FD4A;
 Sat, 23 Dec 2023 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703335611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eq6uZ1zPaOibUmv5NcqUrkQEVjzEQzNYsVkUK9LIluQ=;
 b=jgvwLcqjqQgdx+xT7fpuuhh6LblZT9Xd3e0TcUP6lT1gtOmDvZRudxq5W75OxI2p0eEXmu
 ckS8CKuNraMBOUETzbPi3fgesOVg342pJ+gwIkqXldXxp+4hLwgJ7XA2XubEGArJgdfdEv
 9vKlPuWUkZJiGa1mDfTJMiNWm2K9kKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703335611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eq6uZ1zPaOibUmv5NcqUrkQEVjzEQzNYsVkUK9LIluQ=;
 b=sLXgQir0HjnmfUFa/BWbX0OLW9umv9djDIr3Dl+NtRzXSbqCslPqHbsBe75Z/MPz6Yyyg7
 8ZJXpqMr1K1RTtBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703335611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eq6uZ1zPaOibUmv5NcqUrkQEVjzEQzNYsVkUK9LIluQ=;
 b=jgvwLcqjqQgdx+xT7fpuuhh6LblZT9Xd3e0TcUP6lT1gtOmDvZRudxq5W75OxI2p0eEXmu
 ckS8CKuNraMBOUETzbPi3fgesOVg342pJ+gwIkqXldXxp+4hLwgJ7XA2XubEGArJgdfdEv
 9vKlPuWUkZJiGa1mDfTJMiNWm2K9kKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703335611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eq6uZ1zPaOibUmv5NcqUrkQEVjzEQzNYsVkUK9LIluQ=;
 b=sLXgQir0HjnmfUFa/BWbX0OLW9umv9djDIr3Dl+NtRzXSbqCslPqHbsBe75Z/MPz6Yyyg7
 8ZJXpqMr1K1RTtBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 634D8136F5;
 Sat, 23 Dec 2023 12:46:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id n6lDErvWhmUmDQAAD6G6ig
 (envelope-from <krisman@suse.de>); Sat, 23 Dec 2023 12:46:51 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Amir Goldstein <amir73il@gmail.com>
In-Reply-To: <CAOQ4uxjhWPB6W+EFyuE-eYbLHehOGRLSfs6K62+h8-f9izJG-A@mail.gmail.com>
 (Amir Goldstein's message of "Sat, 23 Dec 2023 08:20:09 +0200")
Organization: SUSE
References: <20231215211608.6449-1-krisman@suse.de>
 <20231219231222.GI38652@quark.localdomain>
 <87a5q1eecy.fsf_-_@mailhost.krisman.be>
 <CAOQ4uxjhWPB6W+EFyuE-eYbLHehOGRLSfs6K62+h8-f9izJG-A@mail.gmail.com>
Date: Sat, 23 Dec 2023 07:46:46 -0500
Message-ID: <875y0pdr2h.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: ****
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FREEMAIL_TO(0.00)[gmail.com]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-1.59)[92.33%]
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jgvwLcqj;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sLXgQir0
X-Spam-Score: -3.90
X-Rspamd-Queue-Id: 9B7051FD4A
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Amir Goldstein <amir73il@gmail.com> writes: >> Amir, would
 you consider this for -rc8? > > IIUC, this fixes a regression from v5.10
 with a very low likelihood of > impact on anyone in the real world, so what's
 the rush? > I would rather that yo [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rH1PC-0007Q6-91
Subject: Re: [f2fs-dev] [PATCH] ovl: Reject mounting case-insensitive
 filesystems
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

Amir Goldstein <amir73il@gmail.com> writes:

>> Amir, would you consider this for -rc8?
>
> IIUC, this fixes a regression from v5.10 with a very low likelihood of
> impact on anyone in the real world, so what's the rush?
> I would rather that you send this fix along with your patch set.
>
> Feel free to add:
>
> Acked-by: Amir Goldstein <amir73il@gmail.com>
>
> after fixing nits below

Thanks for your review.

It is fine to wait, and I'll turn it into part of this series, with
your ack, after fixing the details you pointed out.

Thanks,


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
