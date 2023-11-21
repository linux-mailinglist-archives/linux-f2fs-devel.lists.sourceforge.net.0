Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8487F2400
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Nov 2023 03:29:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5GWN-0008Ro-U0;
	Tue, 21 Nov 2023 02:29:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1r5GWD-0008Rg-Sx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 02:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXgJaCnWAfzXRMpd5bvFRcG7YxYfu713J7p+TxuYhXc=; b=Qf6p6+XZTpdRTVzeOHc45qH4vF
 OUhu+S+ITmyY8Bd5+RcCaF5nAzTnyY6xYDEnolCN7umyogB59wTED5fO/1hV6LuqBsYRep3jVisK8
 wr26L6cmGsiQNI5S1WFneTN64UVpZkHzdD2vggUhpapDwglX3cqyGSsze9c7O/S5Melk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cXgJaCnWAfzXRMpd5bvFRcG7YxYfu713J7p+TxuYhXc=; b=KTXg+E7TmzY50YS6M5Uw8oHoJK
 p1mBhracqbiwLgn9ESNwZazOikXrCZU3GrtI4NUhYPESV1BwbY/J4cLp6qGLOXvahuJk6j0ZNoIqL
 zhqcN3flhCLekAMGXM3OR93WrpNE4gsw3ZUzH9QZV22IZMfwLDVB459ZuUjVGNrOZJ7k=;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r5GW2-0004Yu-NE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 02:29:41 +0000
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-9fffa4c4f43so162130966b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Nov 2023 18:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1700533764; x=1701138564;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cXgJaCnWAfzXRMpd5bvFRcG7YxYfu713J7p+TxuYhXc=;
 b=hSKOnlT31hBYHxPJPxaH0W3q5/yIQtB6KGQt53rXyzB0enk5TSo0qZFNlYyLpvxtoz
 ENIlHeM6jAHakr1Ukbwwv4Hyq56JJEnXQPS70YjZjyhSCAoA6GgEUXzIRfHbdXdoMpwu
 f8JW2HTu1W1OTvEKX7h98jZHZ1Mg1zHTYqrZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700533764; x=1701138564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cXgJaCnWAfzXRMpd5bvFRcG7YxYfu713J7p+TxuYhXc=;
 b=A/Ay8/gY6vYyuOMna6w2vTmGLli+GqQOrmE/Bv9SATu/Eeq00HGu/dyeUCsOBE/4p2
 VGkFXa0MU86FSrK8QHRyM9bYi0D9spoxRoFN4vqGdEYKtIsTTakO76SggKyl8fO9YLzb
 rTNFfqz48oDDK5u+V8ktUCjhYIeakmo6889BHeldc/cSIY+YCuZikYfJlzco4VdGdmOg
 P24TVHhbXtPOGl5226r5PxE9Bfljphr48t7vI9Zf1jSmVGJSjBk3VVxTnPG3mgRfa3R2
 V1bVYDh6BS1mRcaae2/iQCGuVQupFB2jgZ9yWE3XTNBZNi/LE3yUZE8x2u3zMJg/8OSI
 beTQ==
X-Gm-Message-State: AOJu0YwW6vK5q1RinrGRGkY5C1BkqzccZTn0ne3pIgCglqX8FC5NoKcB
 dhr9u2D52gzemHb8bCAFRpf4Zdv/r71ai9X8QzD4ng==
X-Google-Smtp-Source: AGHT+IFABpm09gra6z9yTyGcvoGorlT1i6E6FOhjNiITFtJrpgVuicJrJsNsV6XkcQhyPLnEukvnPw==
X-Received: by 2002:a17:906:7b86:b0:9fe:325b:5a25 with SMTP id
 s6-20020a1709067b8600b009fe325b5a25mr3891251ejo.6.1700533763928; 
 Mon, 20 Nov 2023 18:29:23 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 g12-20020a1709061c8c00b009a1a5a7ebacsm4495193ejh.201.2023.11.20.18.29.23
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 18:29:23 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-548a2c20f50so2775054a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Nov 2023 18:29:23 -0800 (PST)
X-Received: by 2002:a50:9ec2:0:b0:542:e844:5c9b with SMTP id
 a60-20020a509ec2000000b00542e8445c9bmr836227edf.13.1700533762984; Mon, 20 Nov
 2023 18:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121020254.GB291888@mit.edu>
In-Reply-To: <20231121020254.GB291888@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Nov 2023 18:29:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whb80quGmmgVcsq51cXw9dQ9EfNMi9otL9eh34jVZaD2g@mail.gmail.com>
Message-ID: <CAHk-=whb80quGmmgVcsq51cXw9dQ9EfNMi9otL9eh34jVZaD2g@mail.gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 20 Nov 2023 at 18:03, Theodore Ts'o <tytso@mit.edu>
 wrote: > > On Mon, Nov 20, 2023 at 10:07:51AM -0800, Linus Torvalds wrote:
 > > I'm looking at things like > > generic_ci_d_compare(), and it [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.53 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5GW2-0004Yu-NE
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

On Mon, 20 Nov 2023 at 18:03, Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Mon, Nov 20, 2023 at 10:07:51AM -0800, Linus Torvalds wrote:
> >     I'm looking at things like
> > generic_ci_d_compare(), and it hurts to see the mindless "let's do
> > lookups and compares one utf8 character at a time". What a disgrace.
> > Somebody either *really* didn't care, or was a Unicode person who
> > didn't understand the point of UTF-8.
>
> This isn't because of case-folding brain damage, but rather Unicode
> brain damage.

No, it really is just stupidity and horribleness.

The thing is, when you check two strings for equality, the FIRST THING
you should do is to just compare them for exactly that: equality.

And no, the way you do that is not by checking each unicode character
one by one.

You do it by just doing a regular memcmp. In fact, you can do even
better than that: while at it, check whether
 (a) all bytes are equal in everything but bit#5
 (b) none of the bytes have the high  bit set
and you have now narrowed down things in a big way. You can do these
things trivially one whole word at a time, and you'll handle 99% of
all input without EVER doing any Unicode garbage AT ALL.

Yes, yes, if you actually have complex characters, you end up having
to deal with that mess. But no, that is *not* an excuse for saying
"all characters are complex".

So no. There is absolutely zero excuse for doing stupid things, except
for "nobody has ever cared, because case folding is so stupid to begin
with that people just expect it to perform horribly badly".

End result:

 - generic_ci_d_compare() should *not* consider the memcmp() to be a
"fall back to this for non-casefolded". You should start with that,
and if the bytes are equal then the strings are equal. End of story.

 - if the bytes are not equal, then the strings *might* still compare
equal if it's a casefolded directory.

 - but EVEN THEN you shouldn't fall back to actually doing UTF-8
decoding unless you saw the high bit being set at some point.

 - and if they different in anything but bit #5 and you didn't see the
high bit, you know they are different.

It's a bit complicated, yes. But no, doing things one unicode
character at a time is just bad bad bad.

               Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
