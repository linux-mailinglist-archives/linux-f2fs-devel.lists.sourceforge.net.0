Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AD5OQOZp2kCigAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 03:29:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8141F9E07
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 03:29:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Lck9VxvV9OWDnjQyvtoY9A79dDVvAuhfXuS3wTCu20=; b=DtkZn/mS4m6xc36N+ckllzNred
	BXyIS5Ed6oWDd10V0Pd7pvCFBw6ukuj5YojP8moIMjeU3ccsEeJUck1uI508G5mepvu0mzUw5nNp3
	9G41e7zZaBOXDQ5DhtBmWkztk/57K2lPOey92a2A0mXyp66QChFN33FYr4AETJngvUHo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxbz5-0005lu-UP;
	Wed, 04 Mar 2026 02:29:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kuba@kernel.org>) id 1vxbyu-0005lO-Q2
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 02:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wKj0ybLQ7OTEX7VYO4UYrqVGHCViOoCZ3KGzAf4cs5s=; b=Yx4ZXY8Qj3cDsh7WowvONIDcSp
 WVrOUqCUXuCKyLmVwhUXeXCrA4xSn5aYa9ZRhAWVb+0DdiV8Ly7aNu1ubD8qV7CO7TxyfrG4Hcz0Q
 PEYr9rHsqpvnyWSgTzit6QEScct10lGkDD7mDlnUkdCYclRbXGQ9prJI1Z7nHAbCg6ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wKj0ybLQ7OTEX7VYO4UYrqVGHCViOoCZ3KGzAf4cs5s=; b=ZMgd013XqNAsYThrosgAMqoVj4
 dhhb6bNG+MGbZ27J5WjDRV7nY8DTHmqR1OkuPPuz4LRLpc6bBzNz/MqWPCNvrJGjstS1oIf+1ZroH
 6IqCqwGlsKN6ig1ylxyWsVHB3m8lZPKc3v3Cd2E5Hgk8DMDles6a+r4o4CO0tZV1+FAA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxbyu-0002Je-7u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 02:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 41CFF43A1B;
 Wed,  4 Mar 2026 02:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB983C116C6;
 Wed,  4 Mar 2026 02:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772591329;
 bh=w0enNDJ6vj/GjKs1g6Qapybf69Y+ysKOpkctiG5RrpQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=spjB+qe83UoElqhhSNfGwtYNBZK6rgflA8nN48IzNFPIWPeUr3QRcXVdCtF1NJKnf
 z5EksqVKhftC9MLC9j/7nGeIaaTR87yGm5Rwd8MxIRtsUMKdsilMMJ3Cd9iakxj8Bd
 EH9ATACpJVqsf4PLZG7kLZaviIgPJnXRNiYRro7z9N/ZFYixQx9IlT7mTSxw717b7C
 FtZrlDgcd81FIPR+0JhvBn0boDgv6oQAtRyqPocimgjFVPbqTR/7W2RrWO0jyc8Sw9
 QZEusDhvc5/gFZA6KC6+NigNLVm6yl1rbhBl2iBivGRlsjsn6q5oZHNnRRI6Qq4pAT
 NJF9zxNmgNh2w==
Date: Tue, 3 Mar 2026 18:28:45 -0800
To: Yury Norov <ynorov@nvidia.com>
Message-ID: <20260303182845.250bb2de@kernel.org>
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 3 Mar 2026 20:27:08 -0500 Yury Norov wrote: > The
 net/9p networking driver has a handy macro to calculate the > amount of bytes
 from a given pointer to the end of page. Move it > to core/mm, a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxbyu-0002Je-7u
Subject: Re: [f2fs-dev] [PATCH 0/8] mm: globalize rest_of_page() macro
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
From: Jakub Kicinski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jakub Kicinski <kuba@kernel.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Zheng Gu <cengku@gmail.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexander Duyck <alexanderduyck@fb.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-nfs@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@linux.dev>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, David Airlie <airlied@gmail.com>,
 linux-riscv@lists.infradead.org, Simona Vetter <simona@ffwll.ch>,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Yury Norov <yury.norov@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Alexandra Winter <wintera@linux.ibm.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-ext4@vger.kernel.org,
 x86@kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-spi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Aswin Karuvally <aswin@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Thomas Gleixner <tglx@kernel.org>, dm-devel@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Will Deacon <will@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-crypto@vger.kernel.org,
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 virtualization@lists.linux.dev, Eric Van Hensbergen <ericvh@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Janosch Frank <frankja@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, v9fs@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>, Linus Walleij <linusw@kernel.org>,
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Anna Schumaker <anna@kernel.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Namhyung Kim <namhyung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 0E8141F9E07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:lucho@ionkov.net,m:cengku@gmail.com,m:kvm@vger.kernel.org,m:mst@redhat.com,m:peterz@infradead.org,m:catalin.marinas@arm.com,m:alexanderduyck@fb.com,m:dave.hansen@linux.intel.com,m:dri-devel@lists.freedesktop.org,m:perex@perex.cz,m:linux-perf-users@vger.kernel.org,m:linux-mm@kvack.org,m:edumazet@google.com,m:adilger.kernel@dilger.ca,m:linux-nfs@vger.kernel.org,m:dongsheng.yang@linux.dev,m:joonas.lahtinen@linux.intel.com,m:agordeev@linux.ibm.com,m:imbrenda@linux.ibm.com,m:airlied@gmail.com,m:linux-riscv@lists.infradead.org,m:simona@ffwll.ch,m:linux-s390@vger.kernel.org,m:maddy@linux.ibm.com,m:yury.norov@gmail.com,m:herbert@gondor.apana.org.au,m:wintera@linux.ibm.com,m:miklos@szeredi.hu,m:mpe@ellerman.id.au,m:linux-ext4@vger.kernel.org,m:x86@kernel.org,m:tursulin@ursulin.net,m:linux-spi@vger.kernel.org,m:mingo@redhat.com,m:aswin@linux.ibm.com,m:intel-gfx@lists.freedesktop.org,m:borntraeger@linux.ibm.com,m:cem@kernel.org,m:asmadeus@codewreck
 .org,m:tglx@kernel.org,m:dm-devel@lists.linux.dev,m:axboe@kernel.dk,m:aou@eecs.berkeley.edu,m:gor@linux.ibm.com,m:hca@linux.ibm.com,m:will@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:acme@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:bp@alien8.de,m:viro@zeniv.linux.org.uk,m:rodrigo.vivi@intel.com,m:jaegeuk@kernel.org,m:virtualization@lists.linux.dev,m:ericvh@kernel.org,m:pjw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:frankja@linux.ibm.com,m:jani.nikula@linux.intel.com,m:brauner@kernel.org,m:pabeni@redhat.com,m:tytso@mit.edu,m:v9fs@lists.linux.dev,m:seanjc@google.com,m:linusw@kernel.org,m:linux-sound@vger.kernel.org,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:anton.yakovlev@opensynergy.com,m:anna@kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:pbonzini@redhat.com,m:akpm@linux-foundation.org,m:namhyung@kernel.org,m:lin
 uxppc-dev@lists.ozlabs.org,m:davem@davemloft.net,m:trondmy@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ionkov.net,gmail.com,vger.kernel.org,redhat.com,infradead.org,arm.com,fb.com,linux.intel.com,lists.freedesktop.org,perex.cz,kvack.org,google.com,dilger.ca,linux.dev,linux.ibm.com,lists.infradead.org,ffwll.ch,gondor.apana.org.au,szeredi.hu,ellerman.id.au,kernel.org,ursulin.net,codewreck.org,lists.linux.dev,kernel.dk,eecs.berkeley.edu,lists.sourceforge.net,alien8.de,zeniv.linux.org.uk,intel.com,mit.edu,suse.com,lunn.ch,dabbelt.com,opensynergy.com,linux-foundation.org,lists.ozlabs.org,davemloft.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[84];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[kuba@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
> The net/9p networking driver has a handy macro to calculate the
> amount of bytes from a given pointer to the end of page. Move it
> to core/mm, and apply tree-wide. No functional changes intended.
> 
> This series was originally introduced as a single patch #07/12 in:
> 
> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
> 
> Split it for better granularity and submit separately.

I don't get what the motivation is here. Another helper developers
and readers of the code will need to know about just to replace 
obvious and easy to comprehend math.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
