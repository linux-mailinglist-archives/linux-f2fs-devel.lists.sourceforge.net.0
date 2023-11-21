Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF67F24A8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Nov 2023 04:33:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5HVp-0000LG-2U;
	Tue, 21 Nov 2023 03:33:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1r5HVm-0000LA-UQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 03:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EIi2i2u1rSIPQrzJXn8A5YNmAC8BSlreYh/h3LyEO0w=; b=Q0OfiKdHwAgn2msbIOlG/GX/r/
 pLEn9/in6kcGv//n2BjHzHKnUJOW8vnbSiI+HZVS5zH3DcY1FCivw/ouRXtbinWSMEWz/CslFKerN
 ScD8bAsl64rB/pVIyMyJtG6kSX/45a8VcIdt91WAPrqig+7ZTi/YtXpdRHQ1U6QKxo00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EIi2i2u1rSIPQrzJXn8A5YNmAC8BSlreYh/h3LyEO0w=; b=g2UZbQFFFy/KNxFI+31TkfYokM
 EHKpKKu0Zlk/updlhcJfslg5bLE/sJ5xXWf6Rs+c7+JD0tpjmmrjJpkGG8SujydJJvCk9pMHqzEv8
 UnoKcjhvR+3eqTPVNKpBdA8WZXHV2eFfGQREAMHClXQEp/OqT4zXH1DJmewR9/vULvlM=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r5HVe-0005z0-OT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 03:33:17 +0000
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a00c200782dso116502766b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Nov 2023 19:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1700537581; x=1701142381;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EIi2i2u1rSIPQrzJXn8A5YNmAC8BSlreYh/h3LyEO0w=;
 b=YopnEpn1JZ5oDWjhntMhSSzuzOlSD0RDgX8KuBd9EXMnaRRmLQ4mmWagDtxkGSF0oM
 IMGrOZzTOkLyrs+KDkacXiH5jj0ETx0602zbxyenQxluDBeCyjK5PBpBGCWUNSQar/Xd
 jdZdiYWCJISEJtdMTGoEM/L7/ytGv1UAEl0pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700537581; x=1701142381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EIi2i2u1rSIPQrzJXn8A5YNmAC8BSlreYh/h3LyEO0w=;
 b=SlGVAnT1ZapjxY3S9QZmVznLygIxya6GX6XKX6OxDNi5HWyG6EY5TqT8hIKp8o1NXh
 QVUILh/hfH0RRkKHFIlXExysE4mEt8310XAU1OH7kc0xVeMzvfm6sSm8yz0KYDXc/uG3
 USnSQfmqjnYEOdu8ntNViv9E02SIhoBlSkUhRcwnOww18jahir90uBoxGEZqy68VnmrW
 RAP4dtMGMa/IC4ZZfG3nihwRmy7ImLPYm4WDTZbzPjDHQF0UUXgFZjgwhWiug4doM2JS
 sZmICUDZUS43ZU/yoj1N2ZRS00v2z9ZICcKHsVs06drwD6AwqNpbv6EUpnqht6lapkPM
 6idg==
X-Gm-Message-State: AOJu0YwkH4VFGog59gStrv6USFIs0q3yw4F5CaGJ0A7foGeEi3Ad6n8n
 z3jMY/4ldImbgWIN5ZIi6TJXPv++c/lupgVW9sS22Q==
X-Google-Smtp-Source: AGHT+IFZ24MXxGlwOaaGFmMF/WAYxe+S0ZPNjeBX+6+RpKbV6EJ7l1A33BH39dO1Puiv5ZD9nrv6Bw==
X-Received: by 2002:ac2:55b8:0:b0:503:654:cf27 with SMTP id
 y24-20020ac255b8000000b005030654cf27mr6261318lfg.28.1700535811709; 
 Mon, 20 Nov 2023 19:03:31 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 h11-20020a50ed8b000000b00548a3a22d66sm2201709edr.41.2023.11.20.19.03.31
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 19:03:31 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-548f853fc9eso477094a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Nov 2023 19:03:31 -0800 (PST)
X-Received: by 2002:a05:6402:797:b0:543:8391:a19a with SMTP id
 d23-20020a056402079700b005438391a19amr722096edy.40.1700535810689; Mon, 20 Nov
 2023 19:03:30 -0800 (PST)
MIME-Version: 1.0
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121020254.GB291888@mit.edu>
 <CAHk-=whb80quGmmgVcsq51cXw9dQ9EfNMi9otL9eh34jVZaD2g@mail.gmail.com>
In-Reply-To: <CAHk-=whb80quGmmgVcsq51cXw9dQ9EfNMi9otL9eh34jVZaD2g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Nov 2023 19:03:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh+o0Zkzn=mtF6nB1b-EEcod-y4+ZWtAe7=Mi1v7RjUpg@mail.gmail.com>
Message-ID: <CAHk-=wh+o0Zkzn=mtF6nB1b-EEcod-y4+ZWtAe7=Mi1v7RjUpg@mail.gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 20 Nov 2023 at 18:29,
 Linus Torvalds <torvalds@linux-foundation.org>
 wrote: > > It's a bit complicated, yes. But no, doing things one unicode
 > character at a time is just bad bad bad. Put another way: the _point_ of
 UTF-8 is that ASCII is still ASCII. It's literally why UTF-8 doesn't suck.
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5HVe-0005z0-OT
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
 Christian Brauner <brauner@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 20 Nov 2023 at 18:29, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It's a bit complicated, yes. But no, doing things one unicode
> character at a time is just bad bad bad.

Put another way: the _point_ of UTF-8 is that ASCII is still ASCII.
It's literally why UTF-8 doesn't suck.

So you can still compare ASCII strings as-is.

No, that doesn't help people who are really using other locales, and
are actively using complicated characters.

But it very much does mean that you can compare "Bad" and "bad" and
never ever look at any unicode translation ever.

In a perfect world, you'd use all the complicated DCACHE_WORD_ACCESS
stuff that can do all of this one word at a time.

But even if you end up doing the rules just one byte at a time, it
means that you can deal with the common cases without "unicode
cursors" or function calls to extract unicode characters, or anything
like that. You can still treat things as bytes.

So the top of generic_ci_d_compare() should probably be something
trivial like this:

        const char *ct = name.name;
        unsigned int tcount = name.len;

        /* Handle the exact equality quickly */
        if (len == tcount && !dentry_string_cmp(str, ct, tcount))
                return 0;

because byte-wise equality is equality even if high bits are set.

After that, it should probably do something like

        /* Not byte-identical, but maybe igncase identical in ASCII */
        do {
                unsigned char a, b;

                /* Dentry name byte */
                a = *str;

                /* If that's NUL, the qstr needs to be done too! */
                if (!a)
                        return !!tcount;

                /* Alternatively, if the qstr is done, it needed to be NUL */
                if (!tcount)
                        return 1;
                b = *ct;

                if ((a | b) & 0x80)
                        break;

                if (a != b) {
                        /* Quick "not same" igncase ASCII */
                        if ((a ^ b) & ~32)
                                return 1;
                        a &= ~32;
                        if (a < 'A' || a > 'Z')
                                return 1;
                }

                /* Ok, same ASCII, bytefolded, go to next */
                str++;
                ct++;
                tcount--;
                len--;
        }

and only after THAT should it do the utf name comparison (and only on
the remaining parts, since the above will have checked for common
ASCII beginnings).

And the above was obviously never tested, and written in the MUA, and
may be completely wrong in all the details, but you get the idea. Deal
with the usual cases first. Do the full unicode only when you
absolutely have to.

                Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
