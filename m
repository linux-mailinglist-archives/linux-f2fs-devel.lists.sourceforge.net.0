Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGtVFwtqn2lRagQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Feb 2026 22:30:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 933FD19DDA9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Feb 2026 22:30:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aValTcOcTA8soOd+aKxepXxcWRWMWr7lRSR6Vz7ZTA=; b=DnJscxDx0a5GQVa0eIyrxQZ7q0
	3+n7EEYJtluE8BTkjjyh9uCeO+8Q2JtDld2rDuCOacRI8uLtmG/er5Dvc+QdHLFgtJH1QG6y06wYn
	8jafnHUVdHjLbhL1FawlgcygdgnDo9kU/sy6xuabC/eEY0NBu5/cdDGgLKO7IVQIP6g8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvMSx-00045v-3a;
	Wed, 25 Feb 2026 21:30:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1vvMSv-00045o-7w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 21:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZIx7xpJAKG3rp50w4mFIwemSrU7r7VFTxWlJH0AP6ys=; b=i9k9R0KXxqjqxJ5S/HswRShqNC
 8piVTkg0R/RNp3NOJc+sD8hMqW2UknUPIFMFmhz7RczdDP9r9fiS6jm0LpHSjDmqgmrSa5NydgaES
 5cIqlw2Pzu/U0bYycZmtGfpIyA6eyGR2s8ushZ9bwDrhZCeC1AqrB6w+5/L2Vm8e6Cyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZIx7xpJAKG3rp50w4mFIwemSrU7r7VFTxWlJH0AP6ys=; b=EUes7PFMeoWNgC5OZOx07uY1U8
 EyzACUK85RLWT7KLo2opumFOJuH3R3uxOBhSYP20MIIkm0Edi9UfKeAnCysdXjU4im6jbLsChgC1g
 Kb2WVy7r7aGaor9xC70rAhlQhS2wnKfvSOcGJtPIuwdAbN0Urid8L4IB8uK5ClnoKqxw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvMSu-0002DP-Rn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Feb 2026 21:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D39560054
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 21:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44FEC116D0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772055034;
 bh=ZIx7xpJAKG3rp50w4mFIwemSrU7r7VFTxWlJH0AP6ys=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dp7ICODfjVHP0e3iBnDMcVYoRr6pqwa3zZJQfrCtX3nLNHpF/UrGcKUg0t2Aq8PyH
 PG1HwhBvbNrhf1SSFZ5PCDzMyidu00uH4z5W069lrT8flBaJyjlinI1cGFgqyQz2M+
 GSjrHtu7jDs2jwAgrAJ5ab+gEKMaVFdDR/nVWzx0pg2XmRMQzFome6haSMwjHCzuD9
 2DuQJ5TvUZ0NYkXbqE3Ggebetzw/5HTfYJiWW4rOlNa8vg7h2s/te4pPZoM9TAAefk
 E4uKHRRHsESzxFWT6VAwNilx7ix2xMYgX1h9FZmQCYkWCAG4/1LwxDhs7GzU4L7a34
 uU2I5P2iq27dQ==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-7986e0553b0so1004207b3.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Feb 2026 13:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzVrYqFvLhojYDIQ4ZRowwLhS4ZC0x8hkadt6rc4INIvQ9ZuQQS5DwaCquPXCKyvRME51JB4VSzCQydaURcDRm@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwH1BaJ3+QRDnQEBypaC9pDgrTsaz+yEv98alKRMJRWyKdrQruH
 kvkQwyOVMEpegdG9Sp0fMrHAN1lx5UnW0A628mz71GUmPhd+nqIlsHoBxclPC4+k3etDo5PVuys
 4ZAvhSZ0J1Fz6ZGswEyT218sHpUi4QrMbvRD6edQdJA==
X-Received: by 2002:a53:ac82:0:b0:649:ae70:a19 with SMTP id
 956f58d0204a3-64cb7c6774dmr55381d50.55.1772055034234; Wed, 25 Feb 2026
 13:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20260225-pagevec_cleanup-v1-1-38e2246363d2@columbia.edu>
In-Reply-To: <20260225-pagevec_cleanup-v1-1-38e2246363d2@columbia.edu>
Date: Wed, 25 Feb 2026 13:30:23 -0800
X-Gmail-Original-Message-ID: <CACePvbWD_==Un_WQ5yrWRQPW3NYXGGJcrR+1xzJ5==OUeyZOyw@mail.gmail.com>
X-Gm-Features: AaiRm53JD5mYZwCyRFdtabuI7KdUPzXguselTUuNlrQqrScpwNfu5W5ykbSO4eY
Message-ID: <CACePvbWD_==Un_WQ5yrWRQPW3NYXGGJcrR+1xzJ5==OUeyZOyw@mail.gmail.com>
To: Tal Zussman <tz2294@columbia.edu>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks for doing this. On Wed, Feb 25, 2026 at 9:57 AM Tal
 Zussman <tz2294@columbia.edu> wrote: > > struct pagevec was removed in commit
 1e0877d58b1e ("mm: remove struct > pagevec"). Remove remaining forward
 declarations an [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvMSu-0002DP-Rn
Subject: Re: [f2fs-dev] [PATCH] mm: Remove stray references to struct pagevec
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
From: Chris Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chris Li <chrisl@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 David Hildenbrand <david@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Barry Song <baohua@kernel.org>,
 Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,huaweicloud.com,redhat.com,kvack.org,kernel.org,auristor.com,lists.infradead.org,oracle.com,infradead.org,google.com,tencent.com,gmail.com,vger.kernel.org,lists.sourceforge.net,linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:tz2294@columbia.edu,m:mhocko@suse.com,m:shikemeng@huaweicloud.com,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:david@kernel.org,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:Liam.Howlett@oracle.com,m:jaegeuk@kernel.org,m:surenb@google.com,m:baohua@kernel.org,m:kasong@tencent.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:akpm@linux-foundation.org,m:rppt@kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[chrisl@kernel.org]
X-Rspamd-Queue-Id: 933FD19DDA9
X-Rspamd-Action: no action

VGhhbmtzIGZvciBkb2luZyB0aGlzLgoKT24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgOTo1N+KAr0FN
IFRhbCBadXNzbWFuIDx0ejIyOTRAY29sdW1iaWEuZWR1PiB3cm90ZToKPgo+IHN0cnVjdCBwYWdl
dmVjIHdhcyByZW1vdmVkIGluIGNvbW1pdCAxZTA4NzdkNThiMWUgKCJtbTogcmVtb3ZlIHN0cnVj
dAo+IHBhZ2V2ZWMiKS4gUmVtb3ZlIHJlbWFpbmluZyBmb3J3YXJkIGRlY2xhcmF0aW9ucyBhbmQg
Y2hhbmdlCj4gX19mb2xpb19iYXRjaF9yZWxlYXNlKCkncyBkZWNsYXJhdGlvbiB0byBtYXRjaCBp
dHMgZGVmaW5pdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFRhbCBadXNzbWFuIDx0ejIyOTRAY29s
dW1iaWEuZWR1PgoKQWNrZWQtYnk6IENocmlzIExpIDxjaHJpc2xAa2VybmVsLm9yZz4KCkNocmlz
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
