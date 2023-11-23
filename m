Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A647F55C7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 02:16:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5yJs-0005mI-EB;
	Thu, 23 Nov 2023 01:15:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1r5yJn-0005mB-OZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 01:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/KrFqq6blt1lo7Kf9Cf57uU43ncdJqUq9kktaS62s5k=; b=FmMEccNuAA4JyKOEDXVTST9AqM
 odP/36q3M2+id+Zfsz7bd8bPmXM6UsfsRNJAe7K3EbjlUBXbUHTSbtEf6ulWGTXENsg8yDW0N8VjW
 ItdM0lDrUwwWuKktmy6u1H9r9gElZpOzdp+DO9/p4sJuTlvo7UgpI8SiyatI6T7L1coE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/KrFqq6blt1lo7Kf9Cf57uU43ncdJqUq9kktaS62s5k=; b=O0hGyaF+U/+X2qICsVyQZ9ZTYs
 gAy8iLQTSokiU5DNaWWKlAaw2GQNYuIek0xn8kYdjoLSUxNiJcigOlw0XZu0dYNsjssPFigMnlWDL
 cioqc77YUzx09aU0uPjAopmFCyEk1v8mgmYF6j6KKicTgfpofyuFzqdp9D1XGeRKdV4s=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r5yJj-0005iz-Bt for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 01:15:48 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-32f7abbb8b4so218724f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Nov 2023 17:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1700702137; x=1701306937;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/KrFqq6blt1lo7Kf9Cf57uU43ncdJqUq9kktaS62s5k=;
 b=R9zwM9XC8am1FJcJy1KfyBqnP3AE9WN6pvqIq9Nl9+l9OKVnIZ0pyhWYpy0+weE0Te
 lcmrTIl0uY9GvdDBZE/wihMssyQV/lyka2hhAq61pAKBbQzANiq98yHLyQBeXS2Z7zaf
 NyIZEyCNIPk5WLp/QO5n9/++x1tUHwrSKbzng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700702137; x=1701306937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/KrFqq6blt1lo7Kf9Cf57uU43ncdJqUq9kktaS62s5k=;
 b=j/2/kFN8Rp21/PkspPYPiBJCcVhbGOi62fndTkR5u7fOlghvx9LJK4QFI0rO2ce4Kr
 rV7nALZDaqnQ51urTcZNUtIwDH6vXZUsSUR7ZcwCNA9CNcLfjPeuRhYQdztkfrO7gCAb
 ImQJZZwVzU4WetAtnEoZVb+GhdxmgmnZB1gzwYdq08WWPgtDJEMb8PqNpnNAIs/erw8j
 ChatsksYGrNgZWU3PPrGPb+4WixMX43JbdbnMBAwLwkdZXA7iL7yJbaJtmKDO33hnM2K
 /wy5e4VQ3J7zaxhjuPZoS2XqrUjlxY9pfWzoJIcMdkiUuG6r+g+H70nwLuq6xMXvYQN4
 2A0w==
X-Gm-Message-State: AOJu0YxilAVjBGCaZumVyOL7/eXpWv4SnX4pmGdSl78eaRUlRng4+U2P
 jNZWztYgKS64Bp4NVi4Vm0U/W78xffVjmbYrRYtzGA+5
X-Google-Smtp-Source: AGHT+IHWZ9t3cITJCWJtq9gh24aLgl9H7gyJQ8iaKN0oa0uhjmR7Mlswzf97/RN0ElYe4T5fsAC8QQ==
X-Received: by 2002:a50:ee8e:0:b0:532:bf2a:8cbc with SMTP id
 f14-20020a50ee8e000000b00532bf2a8cbcmr2924832edr.16.1700698756149; 
 Wed, 22 Nov 2023 16:19:16 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 p20-20020aa7d314000000b00548ae896153sm29888edq.61.2023.11.22.16.19.14
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 16:19:14 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-549070a04baso450827a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Nov 2023 16:19:14 -0800 (PST)
X-Received: by 2002:a17:906:cc:b0:9fe:3447:a84d with SMTP id
 12-20020a17090600cc00b009fe3447a84dmr2475163eji.23.1700698754069; Wed, 22 Nov
 2023 16:19:14 -0800 (PST)
MIME-Version: 1.0
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
In-Reply-To: <20231122211901.GJ38156@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Nov 2023 16:18:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
Message-ID: <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 22 Nov 2023 at 13:19,
 Al Viro <viro@zeniv.linux.org.uk>
 wrote: > > The serious gap, AFAICS, is the interplay with open-by-fhandle.
 So I'm obviously not a fan of igncase filesystems, but I don't think this
 series actually changes any of that. 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.47 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5yJj-0005iz-Bt
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
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 22 Nov 2023 at 13:19, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> The serious gap, AFAICS, is the interplay with open-by-fhandle.

So I'm obviously not a fan of igncase filesystems, but I don't think
this series actually changes any of that.

> It's not unfixable, but we need to figure out what to do when
> lookup runs into a disconnected directory alias.  d_splice_alias()
> will move it in place, all right, but any state ->lookup() has
> hung off the dentry that had been passed to it will be lost.

I guess this migth be about the new DCACHE_CASEFOLDED_NAME bit.

At least for now, that is only used by generic_ci_d_revalidate() for
negative dentries, so it shouldn't matter for that d_splice_alias()
that only does positive dentries. No?

Or is there something else you worry about?

Side note: Gabriel, as things are now, instead of that

        if (!d_is_casefolded_name(dentry))
                return 0;

in generic_ci_d_revalidate(), I would suggest that any time a
directory is turned into a case-folded one, you'd just walk all the
dentries for that directory and invalidate negative ones at that
point. Or was there some reason I missed that made it a good idea to
do it at run-time after-the-fact?

             Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
