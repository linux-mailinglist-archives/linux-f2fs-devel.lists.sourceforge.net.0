Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A409787BF24
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 15:41:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkmGp-0004de-KA;
	Thu, 14 Mar 2024 14:41:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rkmGo-0004dT-IC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 14:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wG9JWTLr5OXP9cpOv1POjmlWyamPW2vvqR6gpOJQVKc=; b=k9IdgbDZ4QluxwlzxtOzCKUmwO
 escQSwlDUIoiFI+NL9ISlMwEtL6jZiL3drHt3B7/guyL9HJVeZ4JhwTRKm8b+z3hr5aaMxI6MrQaZ
 Wc2tmhVDTyPEmtVNWvD0Vvivn3ZZ0pD9oPyHVaHqsnY0cMsBIVQcFK5ZSyCyiN5gXiXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wG9JWTLr5OXP9cpOv1POjmlWyamPW2vvqR6gpOJQVKc=; b=Kt9YuG7uO6gTKIRU923xOH/Ma+
 37LrCcLkLzvH5fQFdg7csc4bbdyYu0J7D+cTYm17TjU36zDhAqhNAI/PVgvQNDvFAs/V9atpXmt1Q
 3xEhWhzz3AgCmmtPVTr37Qn9FEOtA15uugOY+bvJA86UenxJEgC/NLediTaoIcadUD6o=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rkmGe-0001kd-L8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 14:41:23 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 25C1621C9E;
 Thu, 14 Mar 2024 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710427272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wG9JWTLr5OXP9cpOv1POjmlWyamPW2vvqR6gpOJQVKc=;
 b=h76XgWmUuxD9NXfXtIABjc5MVcushaKkbp0RLa2pms+DJzgvB31t8KJVU0rWB/x5cxLsgL
 KABCxIEL4knvNdzp/A6HzmKl/D80cWe5XlqlyuoPvf4sWj2K74Yq7M6HSXDdrt7KmS2iCQ
 StrF15jx+2qnyO91mhz4PR2lY4kvC+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710427272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wG9JWTLr5OXP9cpOv1POjmlWyamPW2vvqR6gpOJQVKc=;
 b=VJUlb3WVZyBIo1LiKEClrxGqh+X6nWYh7RohFOX/imEfxp0zFRsZb6b43gJ0aph1QknH/0
 bSEU6/FVoLybigDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710427272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wG9JWTLr5OXP9cpOv1POjmlWyamPW2vvqR6gpOJQVKc=;
 b=h76XgWmUuxD9NXfXtIABjc5MVcushaKkbp0RLa2pms+DJzgvB31t8KJVU0rWB/x5cxLsgL
 KABCxIEL4knvNdzp/A6HzmKl/D80cWe5XlqlyuoPvf4sWj2K74Yq7M6HSXDdrt7KmS2iCQ
 StrF15jx+2qnyO91mhz4PR2lY4kvC+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710427272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wG9JWTLr5OXP9cpOv1POjmlWyamPW2vvqR6gpOJQVKc=;
 b=VJUlb3WVZyBIo1LiKEClrxGqh+X6nWYh7RohFOX/imEfxp0zFRsZb6b43gJ0aph1QknH/0
 bSEU6/FVoLybigDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D67551368B;
 Thu, 14 Mar 2024 14:41:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vqwTLocM82W+GgAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 14 Mar 2024 14:41:11 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <aaa4561e-fd23-4b21-8963-7ba4cc99eed3@collabora.com> (Eugen
 Hristev's message of "Thu, 14 Mar 2024 10:44:09 +0200")
Organization: SUSE
References: <20240305101608.67943-1-eugen.hristev@collabora.com>
 <20240305101608.67943-3-eugen.hristev@collabora.com>
 <87edcdk8li.fsf@mailhost.krisman.be>
 <aaa4561e-fd23-4b21-8963-7ba4cc99eed3@collabora.com>
Date: Thu, 14 Mar 2024 10:41:10 -0400
Message-ID: <8734sskha1.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h76XgWmU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VJUlb3WV
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.63 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[14];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-0.995];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-1.12)[88.41%]
X-Spam-Score: -2.63
X-Rspamd-Queue-Id: 25C1621C9E
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: >> Please,
 make sure you actually stress test this patchset with fstests >> against
 both f2fs and ext4 before sending each new version. > > I did run the xfstests,
 however, maybe I did not run the ful [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkmGe-0001kd-L8
Subject: Re: [f2fs-dev] [PATCH v13 2/9] f2fs: Simplify the handling of
 cached insensitive names
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

>> Please, make sure you actually stress test this patchset with fstests
>> against both f2fs and ext4 before sending each new version.
>
> I did run the xfstests, however, maybe I did not run the full suite, or maybe I am
> running it in a wrong way ?

No worries.  Did you manage to reproduce it?

> How are you running the kvm-xfstests with qemu ? Can you share your command
> arguments please ?

I don't use kvm-xfstests.  I run ./check directly:

export SCRATCH_DEV=/dev/loop1
export SCRATCH_MNT=$BASEMNT/scratch
export TEST_DEV=/dev/loop0
export TEST_DIR=$BASEMNT/test
export RESULT_BASE=${BASEMNT}/results
export REPORT_DIR=${BASEMNT}/report
export FSTYP=f2fs

mkfs.f2fs -f -C utf8 -O casefold ${TEST_DEV}

./check -g encrypt,quick

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
