Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB48352122
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Apr 2021 22:53:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lS4K1-0003Fj-Vs; Thu, 01 Apr 2021 20:53:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1lS4K0-0003Fc-SE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Apr 2021 20:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yGKHITxEwhK0Iy01/uiraz05kcK/PxwJp5MiD8PH/OY=; b=Ins6Qxlj2ocDrV4Elh3+7GIX+p
 pyMOaNGSkXImoNCJX6UqikgnXq4KjftEbwMXAi68x2thyuf7+6CiH24TRXWEyYtZFcCNoPJpmWkP4
 DuZ2WwmQvsfXNMRUaWjdebEJXVhB9wwmvXUakVQxcbwZgwygUN0d2v4JA/LrDaK7vvY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yGKHITxEwhK0Iy01/uiraz05kcK/PxwJp5MiD8PH/OY=; b=kuJEkJl5iYkrIaD9vtNlGu0XT1
 BEMl7RVwSWU13FCWECCOuVocHyRa1xNewq4c9+K0evTi5pYlKaa9/DVaEvidPrtDFVkXqwB+CkeGC
 ZTYL28rmnYO94s+4ZmyTVpbR9OC6J6euvAyNDtvXJP8YxQ1t8mDLGJHiVJ+uxFiAEGgQ=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lS4Jy-0004kx-Js
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Apr 2021 20:53:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 272BB6100C;
 Thu,  1 Apr 2021 20:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617310409;
 bh=IeGFO7wQN74UxS4HFnyBTT77n4Wa4GfPsbfpJB6Qlnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NyAgAAhaziRAU8zj1EByvNvVzNYpGkxmEryvVDgLck0vq0MCStLK31Om2yrVXTvgE
 u+Rcydyi7/3x/AKzZ7mYa+xV9A3ipvVDPxOwAEVYM4nFw71uT7Wsk7W12WBJ5Op7G7
 P5lEhp/MR5vN89OsR9PdNpLZIoqVakzUvmxtUSuAcqNmWzwIfwoCsx2p8tk80NJ5Ed
 5HdFHQlHtnlax50ii+08WTeWmhnA7fu9YvM9xVYwv/l7+rhdWvybOsQ9i4iIhYRfC7
 Z6h7cwPG4yfggyxw6mrQpjkIXnERttU2dM6TiBLRx5bdrZsY0bPjFGAz6ZUA2g5Ebr
 GMHxNfjLkpAXA==
Date: Thu, 1 Apr 2021 13:53:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <YGYyxzLu2gmO5CCk@gmail.com>
References: <20210331210751.281645-1-shreeya.patel@collabora.com>
 <20210331210751.281645-5-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331210751.281645-5-shreeya.patel@collabora.com>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lS4Jy-0004kx-Js
Subject: Re: [f2fs-dev] [PATCH v6 4/4] fs: unicode: Add utf8 module and a
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
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Apr 01, 2021 at 02:37:51AM +0530, Shreeya Patel wrote:
> +# utf8data.h_shipped has a large database table which is an auto-generated
> +# decodification trie for the unicode normalization functions and it is not
> +# necessary to carry this large table in the kernel.
> +# Enabling UNICODE_UTF8 option will allow UTF-8 encoding to be built as a
> +# module and this module will be loaded by the unicode subsystem layer only
> +# when any filesystem needs it.
> +config UNICODE_UTF8
> +	tristate "UTF-8 module"
>  	help
>  	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
>  	  support.

Please update this help text to properly describe this option, especially the
consequences of setting it to 'm'.

> +	select UNICODE

'select' should go before 'help'.

>  struct unicode_map *unicode_load(const char *version)
>  {
> +	try_then_request_module(utf8mod, "utf8");
> +	if (!utf8mod) {
> +		pr_err("Failed to load UTF-8 module\n");
> +		return ERR_PTR(-ENODEV);
>  	}
>  
> +	spin_lock(&utf8mod_lock);
> +	if (!utf8mod || !try_module_get(utf8mod)) {
> +		spin_unlock(&utf8mod_lock);
> +		return ERR_PTR(-ENODEV);
> +	}
> +	spin_unlock(&utf8mod_lock);
> +	return static_call(unicode_load_static_call)(version);
>  }
>  EXPORT_SYMBOL(unicode_load);
>  
>  void unicode_unload(struct unicode_map *um)
>  {
>  	kfree(um);
> +
> +	spin_lock(&utf8mod_lock);
> +	if (utf8mod)
> +		module_put(utf8mod);
> +	spin_unlock(&utf8mod_lock);
> +
>  }
>  EXPORT_SYMBOL(unicode_unload);
>  
> +void unicode_register(struct module *owner)
> +{
> +	utf8mod = owner;
> +}
> +EXPORT_SYMBOL(unicode_register);
> +
> +void unicode_unregister(void)
> +{
> +	spin_lock(&utf8mod_lock);
> +	utf8mod = NULL;
> +	spin_unlock(&utf8mod_lock);
> +}
> +EXPORT_SYMBOL(unicode_unregister);


This all looks very broken.  First, when !CONFIG_MODULES, utf8mod will always be
NULL so unicode_load() will always fail.

Also, if the unicode_load_static_call() fails, a reference to the utf8mod will
be leaked.

Also, unicode_unload() can put a reference to the utf8mod that was never
acquired.

Also there is a data race on utf8mod because the accesses to it aren't properly
synchronized.

Please consider something like the following, which I think would address all
these bugs:

static bool utf8mod_get(void)
{
	bool ret;

	spin_lock(&utf8mod_lock);
	ret = utf8mod_loaded && try_module_get(utf8mod);
	spin_unlock(&utf8mod_lock);
	return ret;
}

struct unicode_map *unicode_load(const char *version)
{
	struct unicode_map *um;

	if (!try_then_request_module(utf8mod_get(), "utf8")) {
		pr_err("Failed to load UTF-8 module\n");
		return ERR_PTR(-ENODEV);
	}
	um = static_call(unicode_load_static_call)(version);
	if (IS_ERR(um))
		module_put(utf8mod);
	return um;
}
EXPORT_SYMBOL(unicode_load);

void unicode_unload(struct unicode_map *um)
{
	if (um) {
		kfree(um);
		module_put(utf8mod);
	}
}
EXPORT_SYMBOL(unicode_unload);

void unicode_register(struct module *owner)
{
	spin_lock(&utf8mod_lock);
	utf8mod = owner; /* note: will be NULL if !CONFIG_MODULES */
	utf8mod_loaded = true;
	spin_unlock(&utf8mod_lock);
}
EXPORT_SYMBOL(unicode_register);

void unicode_unregister(void)
{
	spin_lock(&utf8mod_lock);
	utf8mod = NULL;
	utf8mod_loaded = false;
	spin_unlock(&utf8mod_lock);
}
EXPORT_SYMBOL(unicode_unregister);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
