Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PeiH46op2kqjAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 04:35:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C859C1FA723
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 04:35:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkOesxzGtHoRAVb0ERV0LWe0EQ+9ulpTH9y42O7E+GU=; b=QWxHslN0GBveXF8LYfP5RqksCH
	opIqNWj3jfEVCyS3aRkZKNz+ALYXc7KFrjTx8ZPwImA61ZxotlkKwWEnsa9wywXL3dQpiHAYrAvPq
	pAPTSa0wO114xqDxB9ujkWIgmqQ2Ovmi8/XJjPSmnJIkqcNNvvW5yqIoSiPcoBhEqzyE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxd1N-0001wG-ME;
	Wed, 04 Mar 2026 03:35:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1vxd14-0001vo-A4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 03:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NrE0zI+7ilR1NedBJHHio8t27882PDymrHrpls6UPoo=; b=Sm5bk4E8jTCcbFw5Ah4qlTopeX
 QFHk97zUWIq6yLr4R0QtcfgyNDpr28mpjeKxEW5K2KFGyHLMxmgZaVxmOPHYhgTIwyEgQILsFyOHG
 cLl37xjHjopCf0Zl0BsMwwocwB1vR3Ca2rj6e9IRxOArXxIjubXubLzjxZ5Yl1ZmqTPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NrE0zI+7ilR1NedBJHHio8t27882PDymrHrpls6UPoo=; b=QFCwNqAw+b3PtD4pDVrYQWD2D0
 wcnKOuAGe9bY8JVLwm5aN7NpUarVukfwAmZYREwvkS33oH3zZmX0BmNVb2x41KYshZy/HV2goUIbg
 w9lmPSXH45IiszPHKbshS1eEY1s3KYOf5d4DPXWJ1ZcNeoL54ajY/v2Mosp56IkSf6g4=;
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vxd13-0005hI-Oh for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 03:35:18 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7d4be7c4ebeso3198659a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Mar 2026 19:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772595307; x=1773200107;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NrE0zI+7ilR1NedBJHHio8t27882PDymrHrpls6UPoo=;
 b=iU7v0aVbIHmHuzGdUHH8JeF+JtmKG2biV8Wi3kqAH0PY/JWTNDHozxX/iFm6KZ3e0E
 pXRfHy0m72iFpmYZxxgtP6L5lokNWkzakqfaNjX2KkHkLJFbDuVW2x1vQcJe1Dl1LJE7
 2ZbbJyTtKphqATMoSru5joefEWAiJBFWFzCKnXSPSNz+ZDsVCxLwpGUcw8iPYc48/UKD
 oZPEhD/oL0XjHuVbuhGO8RT23LnoKDE2mz+3MkxBtw4FHSZFfuw7ViQ8Fb/RgEeU+9rP
 XMZOa27nf4M9gnWh0TrCbImHlr6yxx9RAdIS0orndmbjODcg2/zR8PPnieEgqOx19w9j
 hPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772595307; x=1773200107;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NrE0zI+7ilR1NedBJHHio8t27882PDymrHrpls6UPoo=;
 b=GRkOYt/4ubfwrz52mxhcr9asis4atUz4LHQ/rGBuzl/9ScFZnqBGcYeayEF5XNdDg0
 qKz2WEkdRkT/+kkEtQU0QPVk/Vw4/FJHNGD93eutlp0Vx3bZd63pLiYUO2sJmjJ0O9oY
 vTGU1unJIQQbRd5qN/PNfBpo8JoIn87hKTBjGhZ9qiFKzD/8NJbZBoThk67WXZQFfQfw
 AOOC0qFe0GePUxo2dcz2eTDyE7ybHiXGtKu1QOG+lokMFGKXRKQZ8QNwUM0vp/Kbc/+F
 FWS9e5NinLkMxSRjbT+lHcuF+6waljTSQvAcjMVybBImUfXoKRCCEZIc4qyzeIOuvVlB
 Jkbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+A2fi6UevspnnjOUIB2dIJ56N1IGqx0Y+aY+Uha8gNwcgdDehgFzsKwJ7z8bpaNvD1oWKe0zvKnfxDZuyuTrD@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyfFQOxoLL6SXp81XAAjkS1va+qJPsvErV77TIOGTNNoStfiPgF
 jVDTEGU+U+rK9EYj+wkM+x2wb6JmMFXwqt67RViDbncXcGb6cnPbwoAEJ+wn4WbnRJA=
X-Gm-Gg: ATEYQzyHu389jOfjn5utPm8g8xfk+OPA8tj/7rKXUlffYzZOyn+2P2Ef+rv0mY7Z+7s
 sIOzRlpaF8S8+Rv+5xzvrZCNH/D3rzAbZAy1XAzVk0qaiMekAvB3piRCjYZ2a8iJO52aVWGQ1U+
 h3PwGNchVx6aHGrnQj87wrEK0+x/WFhV67mwZUmYIVDpbkGRu39i95i2Hrxz6+0qwCH8HCCvN1n
 lHxNrZHJGPfMtZ2rTXiyHPMy5DJAC94uA0bvW4plOfD+Lx/8YARTu3DDbchU4A1kq0Gy4isUGER
 Q7TbGOVR3PkuDzztA1GxfHlkhpfBJKxs1ukXteTaY0rcOllXEilA1uojOlcNzI++q8XLNDfq8Hw
 swoQzdctACcpmJRA+qwo+AS94DYXjvTwAZuwi5O6tjsVLRFFqK9kgWtaSwfuh9BNBG2Q1nv382q
 mqnRZUbsO0OX/64zIsy3d3uoU+E6oWlzP9w5ap3KCCwYs7OcqMxeXE3ReKPFtTyv2dvmLmxgLHu
 ctyOEAnmg==
X-Received: by 2002:a05:6830:6185:b0:7c7:6977:17cb with SMTP id
 46e09a7af769-7d6d139f788mr450044a34.21.1772595307034; 
 Tue, 03 Mar 2026 19:35:07 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d586653f6asm15202012a34.19.2026.03.03.19.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 19:35:06 -0800 (PST)
Message-ID: <e96e851a-9050-4d8c-b1e5-bc3b5d91a84c@kernel.dk>
Date: Tue, 3 Mar 2026 20:35:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yury Norov <ynorov@nvidia.com>, Sean Christopherson <seanjc@google.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
 <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
 <aaedwFwXh9QXS3Ju@google.com> <aaen2pGs0UeiJqz1@yury>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aaen2pGs0UeiJqz1@yury>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/3/26 8:32 PM, Yury Norov wrote: > My motivation is that
 it helps to simplify constructions like this: > > - loff_t cmp_len =
 min(PAGE_SIZE
 - offset_in_page(srcoff), > - PAGE_SIZE - offset_in_page [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.210.54 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vxd13-0005hI-Oh
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
 Jakub Kicinski <kuba@kernel.org>,
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
X-Rspamd-Queue-Id: C859C1FA723
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:seanjc@google.com,m:lucho@ionkov.net,m:cengku@gmail.com,m:kvm@vger.kernel.org,m:mst@redhat.com,m:peterz@infradead.org,m:catalin.marinas@arm.com,m:alexanderduyck@fb.com,m:dave.hansen@linux.intel.com,m:dri-devel@lists.freedesktop.org,m:perex@perex.cz,m:linux-perf-users@vger.kernel.org,m:linux-mm@kvack.org,m:edumazet@google.com,m:adilger.kernel@dilger.ca,m:linux-nfs@vger.kernel.org,m:dongsheng.yang@linux.dev,m:joonas.lahtinen@linux.intel.com,m:agordeev@linux.ibm.com,m:imbrenda@linux.ibm.com,m:airlied@gmail.com,m:linux-riscv@lists.infradead.org,m:simona@ffwll.ch,m:linux-s390@vger.kernel.org,m:maddy@linux.ibm.com,m:yury.norov@gmail.com,m:herbert@gondor.apana.org.au,m:wintera@linux.ibm.com,m:miklos@szeredi.hu,m:mpe@ellerman.id.au,m:linux-ext4@vger.kernel.org,m:x86@kernel.org,m:tursulin@ursulin.net,m:linux-spi@vger.kernel.org,m:mingo@redhat.com,m:aswin@linux.ibm.com,m:intel-gfx@lists.freedesktop.org,m:kuba@kernel.org,m:borntraeger@linux.ibm.com
 ,m:cem@kernel.org,m:asmadeus@codewreck.org,m:tglx@kernel.org,m:dm-devel@lists.linux.dev,m:aou@eecs.berkeley.edu,m:gor@linux.ibm.com,m:hca@linux.ibm.com,m:will@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:acme@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:bp@alien8.de,m:viro@zeniv.linux.org.uk,m:rodrigo.vivi@intel.com,m:jaegeuk@kernel.org,m:virtualization@lists.linux.dev,m:ericvh@kernel.org,m:pjw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:frankja@linux.ibm.com,m:jani.nikula@linux.intel.com,m:brauner@kernel.org,m:pabeni@redhat.com,m:tytso@mit.edu,m:v9fs@lists.linux.dev,m:netdev@vger.kernel.org,m:linusw@kernel.org,m:linux-sound@vger.kernel.org,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:anton.yakovlev@opensynergy.com,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:pbonzini@redhat.com,m:akpm@linux-foundation.org,m:namhyung@kernel.org,m:lin
 uxppc-dev@lists.ozlabs.org,m:davem@davemloft.net,m:trondmy@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[axboe@kernel.dk,linux-f2fs-devel-bounces@lists.sourceforge.net];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On 3/3/26 8:32 PM, Yury Norov wrote:
> My motivation is that it helps to simplify constructions like this:
> 
> -               loff_t cmp_len = min(PAGE_SIZE - offset_in_page(srcoff),
> -                                    PAGE_SIZE - offset_in_page(dstoff));
> +               loff_t cmp_len = min(rest_of_page(srcoff), rest_of_page(dstoff));
> 
> Or this:
> 
> -               if (folio_test_highmem(dst_folio) &&
> -                   chunk > PAGE_SIZE - offset_in_page(dst_off))
> -                       chunk = PAGE_SIZE - offset_in_page(dst_off);
> -               if (folio_test_highmem(src_folio) &&
> -                   chunk > PAGE_SIZE - offset_in_page(src_off))
> -                       chunk = PAGE_SIZE - offset_in_page(src_off);
> +               if (folio_test_highmem(dst_folio) && chunk > rest_of_page(dst_off))
> +                       chunk = rest_of_page(dst_off);
> +               if (folio_test_highmem(src_folio) && chunk > rest_of_page(src_off))
> +                       chunk = rest_of_page(src_off);
> 
> To a point where I don't have to use my brains to decode them. I agree
> it's an easy math. It's just too bulky to my (and 9p guys too) taste.

The thing is, now I have to go lookup what on earth rest_of_page() does,
whereas PAGE_SIZE - offset_in_page(page) is immediately obvious. It's a
classic case of "oh let's add this helper to simplify things" which
really just makes it worse, because now you have to jump to the
definition of rest_of_page().

IOW, just no.

-- 
Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
