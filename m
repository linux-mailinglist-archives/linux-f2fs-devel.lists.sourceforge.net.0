Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F782BA9A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 06:06:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rO9kX-00054v-2U;
	Fri, 12 Jan 2024 05:06:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1rO9kV-00054p-1m
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 05:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dXyIUVvSUCL/muzqemPrKFvk+YTfDh6SV30EeEyNy5E=; b=gYPVDjJ7K8rnBfoiywjRvSJtUS
 Hx9tHj6r5QHa0+ICYNUwkSCCR17M5QMfe88f1jHEA7/XluEwprVPH3D4SeDLYklOOgxQ0luPRm99f
 3vKQmXfVn++PXQuAEOKEj1CrKSy8CFR5X28RI7tRbBqQK+VIjO2X+xQJ5NEDVwOVKWoY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dXyIUVvSUCL/muzqemPrKFvk+YTfDh6SV30EeEyNy5E=; b=Fv+n1pWWY/4UnUVk4nXFGIK7fu
 fUJ4dmg+A3hNRMnZPoigXddcUDgpiJ/9Bid1wKnnipgHCmxBnipP5EmXtn5RIIcG+42T0YfKbGw1m
 UUSm9M3sYoD0fVhH3poJWIet65tes1rUYRa3f52H0wQBuPGa1+29VJVDjmOP0L6kIbBA=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rO9kP-0005xz-PF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 05:06:31 +0000
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so615062466b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jan 2024 21:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1705035970; x=1705640770;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dXyIUVvSUCL/muzqemPrKFvk+YTfDh6SV30EeEyNy5E=;
 b=K3H1HdHsasSQ5He1aR1hbYSB0UVu0hQ64cbCzgnXM87Y6PqntU1GJr53NgGKZpewra
 OWjPDwpUpIptMW7eHTt+ChlmvCZtO2/ZnmXKRTeSUxr/nD68tIB1rCEqAYJLXTSC/Ca9
 90KEz0YoqE3yJu8NKVWLu0JrIHmjzZ8WIUuRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705035970; x=1705640770;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXyIUVvSUCL/muzqemPrKFvk+YTfDh6SV30EeEyNy5E=;
 b=NlPzGrqQf9kQYxnavhV3ud/3mzt067SCC5DYfcb+8Rzeus2adiV7PYvyQooYYqeDY9
 vz1tngDlAIdfTWHTBpA8bHKNOBKpqzVbVAupYaK7/SdEQeuF5Duvctd8q5GEd2gTWtUI
 tXsjPjH7lAShj8Rppl+km3vx/nVLg56C9re+W36SvMOb/eqwXoLY09Agj8LKYWqrb1Qs
 8gJFoUV7i3MUv9TiJRT3dwI6BsmYeGQtaTIFm8cFHz8nDjgFkBIGwR4aSg5s6BKTmuKA
 IRgLL4xN/qmdgrNyrgJEMVNKZt0bWnG88ebINBxAKPLbGO4IyA2GbfpAmd7KXAvvI9bg
 PfkQ==
X-Gm-Message-State: AOJu0YwKUkhVYWa9CGWlnPK7VDq9YXM8e4BvcRm93lMVGvTg6TWVVvJa
 MwA7/w6aaPJenDiHSB+pC89mkcVIJEs5T2JaQwJm3IesVFpScbLq
X-Google-Smtp-Source: AGHT+IEOd8WWyoV+qMxOmFzBtzjEk8x846GURl4wEdQzUuG2jgg3zIG0aurPjgQf0G+UP0HYXLfHDw==
X-Received: by 2002:a17:907:890:b0:a28:a13e:2339 with SMTP id
 zt16-20020a170907089000b00a28a13e2339mr274491ejb.61.1705035969672; 
 Thu, 11 Jan 2024 21:06:09 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 v7-20020a1709063bc700b00a29bd8f9edbsm1358021ejf.72.2024.01.11.21.06.08
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 21:06:09 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so615061466b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jan 2024 21:06:08 -0800 (PST)
X-Received: by 2002:a17:906:f345:b0:a27:c453:8706 with SMTP id
 hg5-20020a170906f34500b00a27c4538706mr303288ejb.125.1705035968579; Thu, 11
 Jan 2024 21:06:08 -0800 (PST)
MIME-Version: 1.0
References: <ZaAzOgd3iWL0feTU@google.com>
In-Reply-To: <ZaAzOgd3iWL0feTU@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 11 Jan 2024 21:05:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgTbey3-RCz8ZpmTsMhUGf02YVV068k3OzrmOvJPowXfw@mail.gmail.com>
Message-ID: <CAHk-=wgTbey3-RCz8ZpmTsMhUGf02YVV068k3OzrmOvJPowXfw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 11 Jan 2024 at 10:28,
 Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.8-rc1 Hmm. I got a somewhat confusing conflict in
 f2fs_rename().
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.43 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.43 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rO9kP-0005xz-PF
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.8-rc1
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 11 Jan 2024 at 10:28, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.8-rc1

Hmm. I got a somewhat confusing conflict in f2fs_rename().

And honestly, I really don't know what the right resolution is. What I
ended up with was this:

        if (old_is_dir) {
                if (old_dir_entry)
                        f2fs_set_link(old_inode, old_dir_entry,
                                                old_dir_page, new_dir);
                else
                        f2fs_put_page(old_dir_page, 0);
                f2fs_i_links_write(old_dir, false);
        }

which seems to me to be the right thing as a resolution. But I note
that linux-next has something different, and it is because Al said in

      https://lore.kernel.org/all/20231220013402.GW1674809@ZenIV/

that the resolution should just be

        if (old_dir_entry)
                f2fs_set_link(old_inode, old_dir_entry, old_dir_page, new_dir);
        if (old_is_dir)
                f2fs_i_links_write(old_dir, false);

instead.

Now, some of those differences are artificial - old_dir_entry can only
be set if old_is_dir is set, so the nesting difference is kind of a
red herring.

But I feel like that f2fs_put_page() is actually needed, or you end up
with a reference leak.

So despite the fact that Al is never wrong, I ended up going with my
gut, and kept my resolution that is different from linux-next.

End result: I'm now very leery of my merge. On the one hand, I think
it's right. On the other hand, the likelihood that Al is wrong is
pretty low.

So please double- and triple-check that merge, and please send in a
fix for it. Presumably with a comment along the lines of "Al was
right, don't try to overthink things".

Hubris. That's the word for thinking you know better than Al.

                Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
