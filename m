Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DC8LYudp2naigAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 03:48:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FB1FA05C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 03:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SClQgoWfpBTG3o4i/3+3oqTAfwOp2Iq+dT/fRiDB+m8=; b=CNg4nRGP8N7x+5VeO37vigCqUd
	bi8yz/sySAlM8W6GUtbUxLmOztY6ePk/FI6uHnb/DTQvCEPvfHf/fhKuDoq7i2kyOK9EvhOBFYmj8
	PeerUaihri3kNzQwovWo1flF+9JYBdPSaoPT8gBpMquKHIPwER5mqwZ4TaV6HUSrzUnc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxcHs-000874-DB;
	Wed, 04 Mar 2026 02:48:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1vxcHh-00086q-MH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 02:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W7dycZCW1i0wVXbu5i6p68JSQ3h2ubeTDMrk86ISU5M=; b=bpvFXWISLwbvip6/M5IcouEWua
 ZgS+Xy0MbmgDVZOFBHUzCjc2veLfAXPpyIecTTaQBL8igcszV5YRO5VPo3cQhzHhaQtmdW4+hzRvP
 9x7x25jruvF5+S3ErAmgx3Ot904zYrtZcQ/X2a0m6JLeTHR6ITnQvYEFWyVoS6MzbVeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W7dycZCW1i0wVXbu5i6p68JSQ3h2ubeTDMrk86ISU5M=; b=PFVYBAXFde+onw0AvN3MNynYDD
 8qgVrLBNXfwWloJSZA63eonHaYUECIDr/oFBzEQAAh7un/wE1fRsPGMgv+SnLIokHxAtPX28GGhx+
 +He53uLZhdbu2I3g51dHzjildcDrld3qEzuRy/d/w5l3M/OZfiCI5vAz1fSDdcCFE9F0=;
Received: from mail-dy1-f173.google.com ([74.125.82.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vxcHf-0003Do-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 02:48:25 +0000
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2be19f05d7dso4440752eec.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Mar 2026 18:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772592493; x=1773197293;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7dycZCW1i0wVXbu5i6p68JSQ3h2ubeTDMrk86ISU5M=;
 b=A5avo6jst4tiiH+GbXks7WESidzpXyXTi9jXiYi9DRhOadmEKTp/mhCZwucUzPk9YO
 X2AkJZYMiKfKGyLJ+vGPeUnD20HYXGkQQ4CCOiiFj8vnQJoMBV/LFE+QY6rAwp8b/VB0
 o1uRELeA19rrpQB6wig2yg5v1UAfVjave0hkw+N6U2sBqgfthUjX09lTNBIHyknzyd3q
 Lda7UnVsuKcTWtY6jzOMewKjljqaSy5TGI6xg8VaH6GBZkRrGJUlCy5NnE/1RSSTUs7b
 41sMt8cbT7Qn9tGb5DxZYl/RpmfzVMWvVwRbhC4UnaBjVfUr1LRtPjXA9sQ0uc2FW+L8
 Bb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772592493; x=1773197293;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7dycZCW1i0wVXbu5i6p68JSQ3h2ubeTDMrk86ISU5M=;
 b=pN4XVbnwIhlFAHGt/frszB5sATaxIa/YTlOtTYr6ztnmLSwQz31Up592am5XrOjX3b
 Xj29p7ppjCj3TBvZ5JpgQWAEdgZaC0XN2EYeSpyT7QM8/ySyhcNZxiXPVnNwGbmaQ0dF
 /Uhey/AtuJe2H0af2Hjk2Uc34qFKszWpn39z+//UHoQF8Ak9RGON8yvlxO8sK7NOtXpy
 ASrbdNDbt9r/QMVEGAeJXtgRIKOa8QFToX83pLHlNvBLZ85FrIEJvBBRmd2dNnKb4nI4
 x8RXnG7UxImU/DnEAPa2sMYbfzVEehTrJMvljRRll8YQejRxHN2jYOkRVyf+4uWOPaun
 boUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJgjDkVRTmFLpgkA0kdlaRfCfipKWjcSERFHkYo0jrMloyNUuDDk2reKGhTh2WUDfCrFZ0d2qKz52YAqn567lO@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwLnPegY4Od/0+y6BYH6f6ErlEOqsjWsQy76TOpLYlhjUZzTyGg
 J/fhFw/TA7ggxwoZtUfNVHoavXdQiyTQJ0P8vCazbLYqvDGKrrQJv2M3KS+z/810fUx4nzICMxb
 5BFFhrSj5Qw==
X-Gm-Gg: ATEYQzzV6aASm62UORTR9FLUktbkeWehN+wRhq7zOLSMaCr0hebv1OnPcowTeRW5OYf
 txMsSlXZUtUAuld6n6SpLw3hfZpjeAfwr3ZpVdoMZY9VAn7zpe3hCPVLTEbYpBpAaSoWjKU1dDi
 72Xm+qHbm4bgyHfjCvrlDhxQiYj9pdJG0cGuyFMu8BgLwOHJrv6D3R0IW7P8Q9xu0T0Xeq10geJ
 PwnmcBTy7ZcxiY+2mAAQrz3EkY6umZlu0xs3U1T1A7UE9sDe1c5BiG0E7Tn/0FvGxvBEx9UVR9Z
 Bpzydruvbfdx5a933Fdh1IPt2kLJqPhnYKkClU38mPGvLf/QaeuNI2NepApUfDzkEHxWEZVqCzh
 Vo4VHyaA0jJx3YJRONfLZRXD4yjldvPanBrFzzwAnSJRod0Fry+y11ltzr3xR0xz8PEiIllkxBh
 Cpmo2jBsClSXLGvJlyTD6E2VeLI1aLAydpIyDIPqu89ZAVYBIw4fE8p/AfOrgd/sIjq/MYCHPwc
 /TB61vkew==
X-Received: by 2002:a05:6820:4a8e:b0:66a:1886:e4bf with SMTP id
 006d021491bc7-67b17703546mr346906eaf.22.1772592166871; 
 Tue, 03 Mar 2026 18:42:46 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-679f2bfee3csm12574800eaf.7.2026.03.03.18.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 18:42:45 -0800 (PST)
Message-ID: <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Date: Tue, 3 Mar 2026 19:42:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>, Yury Norov <ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260303182845.250bb2de@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/3/26 7:28 PM, Jakub Kicinski wrote: > On Tue, 3 Mar 2026
 20:27:08 -0500 Yury Norov wrote: >> The net/9p networking driver has a handy
 macro to calculate the >> amount of bytes from a given pointe [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxcHf-0003Do-P4
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
X-Rspamd-Queue-Id: DF8FB1FA05C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:ynorov@nvidia.com,m:lucho@ionkov.net,m:cengku@gmail.com,m:kvm@vger.kernel.org,m:mst@redhat.com,m:peterz@infradead.org,m:catalin.marinas@arm.com,m:alexanderduyck@fb.com,m:dave.hansen@linux.intel.com,m:dri-devel@lists.freedesktop.org,m:perex@perex.cz,m:linux-perf-users@vger.kernel.org,m:linux-mm@kvack.org,m:edumazet@google.com,m:adilger.kernel@dilger.ca,m:linux-nfs@vger.kernel.org,m:dongsheng.yang@linux.dev,m:joonas.lahtinen@linux.intel.com,m:agordeev@linux.ibm.com,m:imbrenda@linux.ibm.com,m:airlied@gmail.com,m:linux-riscv@lists.infradead.org,m:simona@ffwll.ch,m:linux-s390@vger.kernel.org,m:maddy@linux.ibm.com,m:yury.norov@gmail.com,m:herbert@gondor.apana.org.au,m:wintera@linux.ibm.com,m:miklos@szeredi.hu,m:mpe@ellerman.id.au,m:linux-ext4@vger.kernel.org,m:x86@kernel.org,m:tursulin@ursulin.net,m:linux-spi@vger.kernel.org,m:mingo@redhat.com,m:aswin@linux.ibm.com,m:intel-gfx@lists.freedesktop.org,m:borntraeger@linux.ibm.com,m:cem@kernel.org,m:
 asmadeus@codewreck.org,m:tglx@kernel.org,m:dm-devel@lists.linux.dev,m:aou@eecs.berkeley.edu,m:gor@linux.ibm.com,m:hca@linux.ibm.com,m:will@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:acme@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:bp@alien8.de,m:viro@zeniv.linux.org.uk,m:rodrigo.vivi@intel.com,m:jaegeuk@kernel.org,m:virtualization@lists.linux.dev,m:ericvh@kernel.org,m:pjw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:frankja@linux.ibm.com,m:jani.nikula@linux.intel.com,m:brauner@kernel.org,m:pabeni@redhat.com,m:tytso@mit.edu,m:v9fs@lists.linux.dev,m:seanjc@google.com,m:linusw@kernel.org,m:linux-sound@vger.kernel.org,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:anton.yakovlev@opensynergy.com,m:anna@kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:pbonzini@redhat.com,m:akpm@linux-foundation.org,m:namhyung@kernel.org,m:lin
 uxppc-dev@lists.ozlabs.org,m:davem@davemloft.net,m:trondmy@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[axboe@kernel.dk,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel-dk.20230601.gappssmtp.com:s=20230601];
	FREEMAIL_CC(0.00)[ionkov.net,gmail.com,vger.kernel.org,redhat.com,infradead.org,arm.com,fb.com,linux.intel.com,lists.freedesktop.org,perex.cz,kvack.org,google.com,dilger.ca,linux.dev,linux.ibm.com,lists.infradead.org,ffwll.ch,gondor.apana.org.au,szeredi.hu,ellerman.id.au,kernel.org,ursulin.net,codewreck.org,lists.linux.dev,eecs.berkeley.edu,lists.sourceforge.net,alien8.de,zeniv.linux.org.uk,intel.com,mit.edu,suse.com,lunn.ch,dabbelt.com,opensynergy.com,linux-foundation.org,lists.ozlabs.org,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel-dk.20230601.gappssmtp.com:-];
	RCPT_COUNT_GT_50(0.00)[84];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,kernel.dk:mid]
X-Rspamd-Action: no action

On 3/3/26 7:28 PM, Jakub Kicinski wrote:
> On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
>> The net/9p networking driver has a handy macro to calculate the
>> amount of bytes from a given pointer to the end of page. Move it
>> to core/mm, and apply tree-wide. No functional changes intended.
>>
>> This series was originally introduced as a single patch #07/12 in:
>>
>> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
>>
>> Split it for better granularity and submit separately.
> 
> I don't get what the motivation is here. Another helper developers
> and readers of the code will need to know about just to replace 
> obvious and easy to comprehend math.

I fully agree, I had the same thought reading this.

-- 
Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
