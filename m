Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B273469D5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 21:30:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOnfK-0007WC-4g; Tue, 23 Mar 2021 20:30:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1lOnfI-0007W2-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 20:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2eeO4gycfdnmcB0EOxaEZOSvDw5inuYFimTDoKgzRuw=; b=Is5OraVBN6NXE3IlX4gQohXLOG
 OvAtTrNE5J9wZwM8eAC6bBVhlktSy/htmNQ+C0nAboxBnu5DGf6ppt6rxKjJOOOYaHtVEP/oy6DyK
 4pnO4ymcJLK7uPf2h9739hrxQ4cVMq2+vWHCyqd4PwnR8WFBdC7QNapQ0qM1lUbDMP8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2eeO4gycfdnmcB0EOxaEZOSvDw5inuYFimTDoKgzRuw=; b=AswmKOZuenmFW+TjQGfZ2C1erz
 rToXmxBf5FjRwFwo37Y4ZCjNCGMkKl/OYNz4hpwOe3lWPjUwEPq6N1DZedQj2ebM86GS5fKVirmBL
 hQWcDVR63cdWdt6L/UZwYQ1Vx4uRfgyKpONCbwQJ77zZURaFS0blpE4/NtIIcYjxLkk8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOnf9-00032S-JC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 20:30:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A199B61574;
 Tue, 23 Mar 2021 20:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616531398;
 bh=5uEEXNBNpUkAWi19Nx2a+xcECI3KdCLMy29coAMWD/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KbCWSY0yi67k73aDL9qCcK2XjjEbxP47nt/LlQgN0JM8kGdCLl1FaXCqXbujVnfvD
 Ugkvyywka2erOm5B5pPJWoU7mye3vJUMVi9c/RTIWQLAyUlTPcPIVODIz3akc10BwM
 QS6PGZwb2na6/m1afaShMwXbA1joNOFqt0IO+mI1lMI5hxhhlmexn+ObQVzbOxoFpX
 9CFQHU37NxJQj4M9oZr7vrwCECq7aTckgEmBZfNFlcUH9ENZhXnxmgCjeJZ12/5U44
 oDZvswilEd6CNQ/YF0NwropEzSVLlfFvpUcxhuBUKF6v5LCFPYfwskpkGROrRPwIJS
 OYYbIhXqOklYw==
Date: Tue, 23 Mar 2021 13:29:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YFpPxCQiMLqctIuS@gmail.com>
References: <20210323183201.812944-1-shreeya.patel@collabora.com>
 <20210323183201.812944-6-shreeya.patel@collabora.com>
 <87eeg5d4xb.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87eeg5d4xb.fsf@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lOnf9-00032S-JC
Subject: Re: [f2fs-dev] [PATCH v3 5/5] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 23, 2021 at 03:51:44PM -0400, Gabriel Krisman Bertazi wrote:
> > -int unicode_validate(const struct unicode_map *um, const struct qstr *str)
> > -{
> > -	const struct utf8data *data = utf8nfdi(um->version);
> > -
> > -	if (utf8nlen(data, str->name, str->len) < 0)
> > -		return -1;
> > -	return 0;
> > -}
> > +struct unicode_ops *utf8_ops;
> > +EXPORT_SYMBOL(utf8_ops);
> > +
> > +int _utf8_validate(const struct unicode_map *um, const struct qstr *str)
> > +{
> > +	return 0;
> > +}
> > -EXPORT_SYMBOL(unicode_validate);
> 
> I think that any calls to the default static calls should return errors
> instead of succeeding without doing anything.
> 
> In fact, are the default calls really necessary?  If someone gets here,
> there is a bug elsewhere, so WARN_ON and maybe -EIO.  
> 
> int unicode_validate_default_static_call(...)
> {
>    WARN_ON(1);
>    return -EIO;
> }
> 
> Or just have a NULL default, as I mentioned below, if that is possible.
> 
[...]
> > +DEFINE_STATIC_CALL(utf8_validate, _utf8_validate);
> > +DEFINE_STATIC_CALL(utf8_strncmp, _utf8_strncmp);
> > +DEFINE_STATIC_CALL(utf8_strncasecmp, _utf8_strncasecmp);
> > +DEFINE_STATIC_CALL(utf8_strncasecmp_folded, _utf8_strncasecmp_folded);
> > +DEFINE_STATIC_CALL(utf8_normalize, _utf8_normalize);
> > +DEFINE_STATIC_CALL(utf8_casefold, _utf8_casefold);
> > +DEFINE_STATIC_CALL(utf8_casefold_hash, _utf8_casefold_hash);
> > +DEFINE_STATIC_CALL(utf8_load, _utf8_load);
> > +DEFINE_STATIC_CALL_NULL(utf8_unload, _utf8_unload);
> > +EXPORT_STATIC_CALL(utf8_strncmp);
> > +EXPORT_STATIC_CALL(utf8_strncasecmp);
> > +EXPORT_STATIC_CALL(utf8_strncasecmp_folded);
> 
> I'm having a hard time understanding why some use
> DEFINE_STATIC_CALL_NULL, while other use DEFINE_STATIC_CALL.  This new
> static call API is new to me :).  None of this can be called if the
> module is not loaded anyway, so perhaps the default function can just be
> NULL, per the documentation of include/linux/static_call.h?
> 
> Anyway, Aren't utf8_{validate,casefold,normalize} missing the
> equivalent EXPORT_STATIC_CALL?
> 

The static_call API is fairly new to me too.  But the intent of this patch seems
to be that none of the utf8 functions are called without the utf8 module loaded.
If they are called, it's a kernel bug.  So there are two options for what to do
if it happens anyway:

  1. call a "null" static call, which does nothing

*or*

  2. call a default function which does WARN_ON_ONCE() and returns an error if
     possible.

(or 3. don't use static calls and instead dereference a NULL utf8_ops like
previous versions of this patch did.)

It shouldn't really matter which of these approaches you take, but please be
consistent and use the same one everywhere.

> + void unicode_unregister(void)
> + {
> +         spin_lock(&utf8ops_lock);
> +         utf8_ops = NULL;
> +         spin_unlock(&utf8ops_lock);
> + }
> + EXPORT_SYMBOL(unicode_unregister);

This should restore the static calls to their default values (either NULL or the
default functions, depending on what you decide).

Also, it's weird to still have the utf8_ops structure when using static calls.
It seems it should be one way or the other: static calls *or* utf8_ops.

The static calls could be exported, and the module could be responsible for
updating them.  That would eliminate the need for utf8_ops.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
