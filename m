Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D8152593
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Feb 2020 05:22:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1izCCK-0008Dw-8w; Wed, 05 Feb 2020 04:21:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1izCCI-0008Do-Rj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 04:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fqzN6b452rdZZaRyKiGrVh5MWdZs8ZehY7iXYXh+iBM=; b=UBSS4w+ZAoWp9EOPkcjcbNb0BU
 T68rnX5e77jr/H7KIuwhl6DwH6vF+NZWA26jgCyeRSa+LgNMpiGMzbSW2yWbZUZyCEcl1k9IQvRG9
 uzVsT/j1JveJH4o76LlFXLjXj4jyKbOJ+A69xTI7GU5/Uwn0u2p2ucl3iHRlkQXDwVkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fqzN6b452rdZZaRyKiGrVh5MWdZs8ZehY7iXYXh+iBM=; b=fHxZa6TgOETX8QIzAA/+pBVGOH
 bROP39bKXsF/UaU4bUtwlJW4xuwaQI5Z13nXAYZt86uJPAFwT2FB0Of0txL9DfnXwdVlSrDTchVoK
 BvFusV83eXmrpAFqP5tXneWqVjXBPSK1FJjZM84BF3E0MyZbXGhWqpT9zlVM19QYKw5Y=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1izCCH-00AZyO-8c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 04:21:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 694AB29298E
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Organization: Collabora
References: <20200128230328.183524-1-drosen@google.com>
 <20200128230328.183524-2-drosen@google.com>
 <85sgjsxx2g.fsf@collabora.com>
 <CA+PiJmS3kbK8220QaccP5jJ7dSf4xv3UrStQvLskAtCN+=vG_A@mail.gmail.com>
Date: Tue, 04 Feb 2020 23:21:33 -0500
In-Reply-To: <CA+PiJmS3kbK8220QaccP5jJ7dSf4xv3UrStQvLskAtCN+=vG_A@mail.gmail.com>
 (Daniel Rosenberg's message of "Tue, 4 Feb 2020 19:05:02 -0800")
Message-ID: <85h8051x6a.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1izCCH-00AZyO-8c
Subject: Re: [f2fs-dev] [PATCH v6 1/5] unicode: Add standard casefolded d_ops
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daniel Rosenberg <drosen@google.com> writes:

> On Sun, Feb 2, 2020 at 5:46 PM Gabriel Krisman Bertazi
> <krisman@collabora.com> wrote:
>>
>>
>> I don't think fs/unicode is the right place for these very specific
>> filesystem functions, just because they happen to use unicode.  It is an
>> encoding library, it doesn't care about dentries, nor should know how to
>> handle them.  It exposes a simple api to manipulate and convert utf8 strings.
>>
>> I saw change was after the desire to not have these functions polluting
>> the VFS hot path, but that has nothing to do with placing them here.
>>
>> Would libfs be better?  or a casefolding library in fs/casefold.c?
>>
>>
>> --
>> Gabriel Krisman Bertazi
>
> The hash function needs access to utf8ncursor, but apart from that,
> libfs would make sense. utf8ncursor is the only reason I have them
> here. How do you feel about exposing utf8cursor or something similar?

Hi,

It was designed to be an internal thing, but I'm ok with exposing it.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
