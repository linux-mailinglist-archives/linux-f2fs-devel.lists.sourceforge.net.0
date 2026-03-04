Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJPvL+Gtp2mSjAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 04:58:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F28631FA8D4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 04:58:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H31bDBDUMOspBi7qqPUQlV1voaHAS/J+fXM+AIYtL4w=; b=bwsDBT0NXKWY/saXclPjUaPbqS
	GWRDlnHd5WVUkrZhV6iimDY92QfHaHOMDFBFYS6wrjy/QGNloD8zr8its4cUkInto0f5Xkkd23vJi
	C9TVz4Y3Enph+JeisbLzek6j9o6kyZmeFrMCSrYr3IYm032bd8m3g3poei2LUoDZTK0w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxdNI-0001q2-FM;
	Wed, 04 Mar 2026 03:58:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3wZ2naQYKAO4iUQdZSWeeWbU.Sec@flex--seanjc.bounces.google.com>)
 id 1vxdNG-0001pv-Le for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 03:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wlfxAiLCYE9X+ss6Nds/jzCWOjzdQvgrRAY6r5Hx7j0=; b=MP1bAP3Kbp0Dkqgb+EG8xtQNfl
 eNcwKOJDAR6kxHO3uFra2B7O7GFKMkapR0z/IEKA7Ft83UrQVsE5o91471uWbw5oPyhkP9oxpoZER
 yNBCDSik5wgBOZCo8b+u95etG/L8Z6GxucEa5/h6MFEXehzCNvI0V+7LZQa0BBW5kW8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wlfxAiLCYE9X+ss6Nds/jzCWOjzdQvgrRAY6r5Hx7j0=; b=Moe0Xv/dHkgD0bjduDbGn+0aPS
 gLvk7jf3jAtONOzvfixu8Lu/doTALCqV8/HtxXbNkd6BBizmhiSdfWDnLhcL9fVgusXuY6V06/vDC
 IrnInQdi8F+BG0tlR5TLhBLJai1miUJQlNrO3bwT7srJLhlW6nifW9I1Lk4BiFV62ggc=;
Received: from mail-qt1-f201.google.com ([209.85.160.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vxdNG-0006ru-6F for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 03:58:14 +0000
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-503342386a8so487255381cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Mar 2026 19:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772596683; x=1773201483;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wlfxAiLCYE9X+ss6Nds/jzCWOjzdQvgrRAY6r5Hx7j0=;
 b=bORBcLmXu2tRTtT1ZiCkAKYb6+QMXSsinCPZWDJlrYv7sCHOKL8drLNk22LK4J8Z/t
 86GioinEkKBUbAl0a1jrdCjrTmA6diCe/Ah6UhcY006Olm+5vtAfbS6Fo500hIfBoCVX
 P1ew2Ds73xp/fP5OMMYk1TZ6Hb+cfT7i5Yh4FO9JJbHNfTln/uS9EUCq6fMIqPoyk45R
 nXxT29M3/Hh23LcoEhFq+kVn7A3vwNBcUnLvOMyCgp348B975GRc/SaNRpS7sH/5V1d3
 Atw89ykU0Y6RuHNUMnxiCmRfY9FMB2mbPY+Y1tOb3kau7gP3WQzMyjRKMtSMau1b8Bxv
 vVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772596683; x=1773201483;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wlfxAiLCYE9X+ss6Nds/jzCWOjzdQvgrRAY6r5Hx7j0=;
 b=bgr3j71lI1V7FMvnuXb0cZlLaMRMjikR5HpV6DvBMtrc7ClKTSlB/voEeNUyZUXg3O
 uPDMZoQrNdrkg0gIgjqzZhJKq1rI1Fsu6xvQiRjK8ZWVejgp8jwUW9AZgTMzpXmlKHC2
 eLbfWqrvSdPNIq/j9bz8Qis4bQ84RqlUF2Ej91BUoJv5WwPs4THoEs+FBeX2Pger3e6G
 b7r8+fyt/39A28oh9zxolZqcTwMVgmILOuj7mJV0PUeWu7HAJ7vNSrOOpArTTuDBh0Qa
 OTnk85swto7dyd7onRIWVlpWwbSoC0zniQzt23jJq/s5xF6wC7+jtMzNZNmnxtOGEU8c
 1SfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAinHTpzXVBldI5iwF3I8Jpk/GMOSRkeQDgDRPWMSnZQe+BJk9kwas3QqsSmMGXErDX5OCczf8qY17t8RZ14+h@lists.sourceforge.net
X-Gm-Message-State: AOJu0YywuXoK8CdUjx8y4u2wfeBxhtde7UFb+vHoQigmy9fZWgjEegdq
 0ZiZnhBBdILc2LQUQBNkaX2JVNIGTUxCLumUHVSf4W6tiYMMFPTUM1xGK/GjX2IWViy7vI+NVY0
 WqPzZCQ==
X-Received: from plzv9.prod.google.com ([2002:a17:902:b7c9:b0:2ae:6338:73ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2446:b0:2ae:483f:b239
 with SMTP id d9443c01a7336-2ae6aaf9469mr6114485ad.30.1772592577810; Tue, 03
 Mar 2026 18:49:37 -0800 (PST)
Date: Tue, 3 Mar 2026 18:49:36 -0800
In-Reply-To: <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Mime-Version: 1.0
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
 <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Message-ID: <aaedwFwXh9QXS3Ju@google.com>
To: Jens Axboe <axboe@kernel.dk>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 03, 2026, Jens Axboe wrote: > On 3/3/26 7:28 PM, 
 Jakub Kicinski wrote: > > On Tue, 3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
 > >> The net/9p networking driver has a handy macro to calcul [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.201 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxdNG-0006ru-6F
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
From: Sean Christopherson via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sean Christopherson <seanjc@google.com>
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
 x86@kernel.org, Yury Norov <ynorov@nvidia.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, linux-spi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Aswin Karuvally <aswin@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Thomas Gleixner <tglx@kernel.org>, dm-devel@lists.linux.dev,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-crypto@vger.kernel.org,
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 virtualization@lists.linux.dev, Eric Van Hensbergen <ericvh@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Janosch Frank <frankja@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, v9fs@lists.linux.dev, netdev@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Namhyung Kim <namhyung@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: F28631FA8D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:lucho@ionkov.net,m:cengku@gmail.com,m:kvm@vger.kernel.org,m:mst@redhat.com,m:peterz@infradead.org,m:catalin.marinas@arm.com,m:alexanderduyck@fb.com,m:dave.hansen@linux.intel.com,m:dri-devel@lists.freedesktop.org,m:perex@perex.cz,m:linux-perf-users@vger.kernel.org,m:linux-mm@kvack.org,m:edumazet@google.com,m:adilger.kernel@dilger.ca,m:linux-nfs@vger.kernel.org,m:dongsheng.yang@linux.dev,m:joonas.lahtinen@linux.intel.com,m:agordeev@linux.ibm.com,m:imbrenda@linux.ibm.com,m:airlied@gmail.com,m:linux-riscv@lists.infradead.org,m:simona@ffwll.ch,m:linux-s390@vger.kernel.org,m:maddy@linux.ibm.com,m:yury.norov@gmail.com,m:herbert@gondor.apana.org.au,m:wintera@linux.ibm.com,m:miklos@szeredi.hu,m:mpe@ellerman.id.au,m:linux-ext4@vger.kernel.org,m:x86@kernel.org,m:ynorov@nvidia.com,m:tursulin@ursulin.net,m:linux-spi@vger.kernel.org,m:mingo@redhat.com,m:aswin@linux.ibm.com,m:intel-gfx@lists.freedesktop.org,m:kuba@kernel.org,m:borntraeger@linux.ibm.com,m
 :cem@kernel.org,m:asmadeus@codewreck.org,m:tglx@kernel.org,m:dm-devel@lists.linux.dev,m:aou@eecs.berkeley.edu,m:gor@linux.ibm.com,m:hca@linux.ibm.com,m:will@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:acme@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:bp@alien8.de,m:viro@zeniv.linux.org.uk,m:rodrigo.vivi@intel.com,m:jaegeuk@kernel.org,m:virtualization@lists.linux.dev,m:ericvh@kernel.org,m:pjw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:frankja@linux.ibm.com,m:jani.nikula@linux.intel.com,m:brauner@kernel.org,m:pabeni@redhat.com,m:tytso@mit.edu,m:v9fs@lists.linux.dev,m:netdev@vger.kernel.org,m:linusw@kernel.org,m:linux-sound@vger.kernel.org,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:anton.yakovlev@opensynergy.com,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:pbonzini@redhat.com,m:akpm@linux-foundation.org,m:namhyung@kernel.org,m:linux
 ppc-dev@lists.ozlabs.org,m:davem@davemloft.net,m:trondmy@kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20230601];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[ionkov.net,gmail.com,vger.kernel.org,redhat.com,infradead.org,arm.com,fb.com,linux.intel.com,lists.freedesktop.org,perex.cz,kvack.org,google.com,dilger.ca,linux.dev,linux.ibm.com,lists.infradead.org,ffwll.ch,gondor.apana.org.au,szeredi.hu,ellerman.id.au,kernel.org,nvidia.com,ursulin.net,codewreck.org,lists.linux.dev,eecs.berkeley.edu,lists.sourceforge.net,alien8.de,zeniv.linux.org.uk,intel.com,mit.edu,suse.com,lunn.ch,dabbelt.com,opensynergy.com,linux-foundation.org,lists.ozlabs.org,davemloft.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_GT_50(0.00)[84];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,netdev];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026, Jens Axboe wrote:
> On 3/3/26 7:28 PM, Jakub Kicinski wrote:
> > On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
> >> The net/9p networking driver has a handy macro to calculate the
> >> amount of bytes from a given pointer to the end of page. Move it
> >> to core/mm, and apply tree-wide. No functional changes intended.
> >>
> >> This series was originally introduced as a single patch #07/12 in:
> >>
> >> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
> >>
> >> Split it for better granularity and submit separately.
> > 
> > I don't get what the motivation is here. Another helper developers
> > and readers of the code will need to know about just to replace 
> > obvious and easy to comprehend math.
> 
> I fully agree, I had the same thought reading this.

+1 from KVM-land.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
