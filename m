Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EE8161B2C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 20:02:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3lf6-0001LF-14; Mon, 17 Feb 2020 19:02:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1j3lf4-0001L7-WD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 19:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+wgOs3/EW8oMDpazz3dppykZCPquf7P3wzczmVj3vU=; b=C7HNGhjwLAymu8TASFQn+PXY7f
 /VrVyWyNl8IrSoj8///j1+io7icBb7AbGQjMZVXlOWI57mPvmAF2CGs6mlFPCGH22rQFY6vGuUVii
 /PiFZ3tAJOKbXLFmE4A6fZ6Wck6VBprGAgu0wE93tnFPFTSfwYWL6q1/5QyGm1q+XQSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U+wgOs3/EW8oMDpazz3dppykZCPquf7P3wzczmVj3vU=; b=cqSvKthiQYO4CJl2NIEz9Lncmk
 BqSmIHtJNxOSVCnM08VN0sK+97XaDw6U/m/nQ7srgDajBDxNTHqZEj3p+8eua66ynuAbidspWqIQy
 bt7+mrv6P5u49f7xcv0cadnN72ius38LIO6BrvK6T5mwD4XNwRcgk0BNYKmVtDNUZ+ac=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3lf2-00FmRx-MR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 19:02:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id A833F292457
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Organization: Collabora
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-2-drosen@google.com>
 <20200212033800.GC870@sol.localdomain>
 <CA+PiJmT_8EzyFO283_E62+UC6vtCGOJXKHAFqnH3QM9LA+PHAw@mail.gmail.com>
Date: Mon, 17 Feb 2020 14:02:10 -0500
In-Reply-To: <CA+PiJmT_8EzyFO283_E62+UC6vtCGOJXKHAFqnH3QM9LA+PHAw@mail.gmail.com>
 (Daniel Rosenberg's message of "Fri, 14 Feb 2020 13:47:37 -0800")
Message-ID: <8536b95971.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1j3lf2-00FmRx-MR
Subject: Re: [f2fs-dev] [PATCH v7 1/8] unicode: Add utf8_casefold_iter
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

> On Tue, Feb 11, 2020 at 7:38 PM Eric Biggers <ebiggers@kernel.org> wrote:
>>
>> Indirect function calls are expensive these days for various reasons, including
>> Spectre mitigations and CFI.  Are you sure it's okay from a performance
>> perspective to make an indirect call for every byte of the pathname?
>>
>> > +typedef int (*utf8_itr_actor_t)(struct utf8_itr_context *, int byte, int pos);
>>
>> The byte argument probably should be 'u8', to avoid confusion about whether it's
>> a byte or a Unicode codepoint.
>>

just for the record, we use int utf8byte because it can fail
error codes, but that is not the case here.  It should be u8.

>
> Gabriel, what do you think here? I could change it to either exposing
> the things necessary to do the hashing in libfs, or instead of the
> general purpose iterator, just have a hash function inside of unicode
> that will compute the hash given a seed value.

Sorry for the delay, I'm away on a long vacation and intentionally
staying away from my laptop :)

Eric has a very good point, if not prohibitively, it is unnecessarily
expensive for a hot path.  Why not expose utf8ncursor and utf8byte to
libfs and implement the hash in libfs?

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
