Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C93EA5DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 22:59:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPw02-0001Ur-Od; Wed, 30 Oct 2019 21:59:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iPw01-0001Uc-1f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 21:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S7mK3Uoiwaws9OYl+5bVE084OvHB6LGX6Sfc0eSAjwc=; b=eDgMgrGRkERnKAamPW6qjlKJ8k
 6/8/h1x9F5Yq21RkszrpBEFViIrSZ7D1PWzyLamPYc/w9yultnIGKXL75Lg9ekQUAfER+nUHsXu+i
 qXXXVLeIMt+c1CQVr1Puhs5oTV3KmbGdSTeoOHKOqkhSqFnE8QrqGt3cdBmGg2q6Vcok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S7mK3Uoiwaws9OYl+5bVE084OvHB6LGX6Sfc0eSAjwc=; b=Zp11WwMXfsA2MnFi1vxnXoO0cO
 Jm99rfXhjQCV8kR8GpJMhAZPwPgyJt6SE10LNbXdE5zwAVuU1NeA8yH/MWKkMLgLrrNlw7lFLpxZy
 DEIP8JoBPCNiKkqYSLpWzkLKsjPFgu8/I6sud3HnXS6BMb7cex/WlFQfXdxYs3CTfYqY=;
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iPvzv-00BXCv-E7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 21:59:28 +0000
Received: by mail-il1-f195.google.com with SMTP id t9so1279073ils.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Oct 2019 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S7mK3Uoiwaws9OYl+5bVE084OvHB6LGX6Sfc0eSAjwc=;
 b=aKsZ4bdZUSBifwnA9EI/sfdmKnP62vGSwIqzhbMUiTCUkHM2p7iqF53Jzgdv5kXvv6
 GBFkJoqdRYLQIybUp5uZd8C9F7L2xM/7BvH0VitcMonLl80SQX9+/8cxz1Pb55faR4eW
 W84909D8+2Y2GxJriYNmqjYg9MaPiledZHFQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7mK3Uoiwaws9OYl+5bVE084OvHB6LGX6Sfc0eSAjwc=;
 b=c49Jy/QEiBZbvgzlVG04t8zV8LM8NK5fQax0/oc0q8+Py+TOPik411zNCAQLFNZ9le
 PxTe2mrSP7iqqa2knhFwImopnFaKQaLhhY1TpJaAsLBrSD1Qz9N4eXdt+e3VsoZ7Ph7n
 pOXnqo+yYBGT3r9FxmgeyQLhDkf9aeK9ti7zQhBrohLy7XZlmFBmwdJc1xfiRvyN0TaB
 k3VviwqeBjUdpVenrK+JqkPszIY9ZJ3ZJR8DkQDCJX8FWsyvSEAfb1DXiwJiXRU+WyuC
 lQQUPkaZKIhKdJybK0KaWNYsKC0hDGp2FQhZQUxCemCCaVFfgk8vnU3t2I9k3B6CvII4
 XHlQ==
X-Gm-Message-State: APjAAAU9x95+mt5PNhEVmMY3cG0DwgFoHmTLmp6WAwqXItCHt8GGXg5k
 LLzPy6ARkY3RZ6GzO7qoSvTj+VE70vQ=
X-Google-Smtp-Source: APXvYqzSWyi9pcYh1BCnE+Ar+QMIudVy8zLiwN9RXdqXMYTNd7Idy6t156J3l8SoNDpXv6LE69Pbpw==
X-Received: by 2002:a92:7f0f:: with SMTP id a15mr2434309ild.116.1572472757508; 
 Wed, 30 Oct 2019 14:59:17 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173])
 by smtp.gmail.com with ESMTPSA id c73sm213142ila.9.2019.10.30.14.59.15
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2019 14:59:15 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id s75so3562430ilc.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Oct 2019 14:59:15 -0700 (PDT)
X-Received: by 2002:a92:ba1b:: with SMTP id o27mr2484026ili.269.1572472754921; 
 Wed, 30 Oct 2019 14:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain>
 <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain>
 <20191030205745.GA216218@sol.localdomain>
In-Reply-To: <20191030205745.GA216218@sol.localdomain>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Oct 2019 14:59:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
Message-ID: <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iPvzv-00BXCv-E7
Subject: Re: [f2fs-dev] [PATCH] Revert "ext4 crypto: fix to check feature
 status before get policy"
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
Cc: Jonathan Corbet <corbet@lwn.net>, Gwendal Grignou <gwendal@chromium.org>,
 linux-ext4@vger.kernel.org, Ryo Hashimoto <hashimoto@chromium.org>,
 linux-doc@vger.kernel.org, Vadim Sukhomlinov <sukhomlinov@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, apronin@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On Wed, Oct 30, 2019 at 1:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> FWIW, from reading the Chrome OS code, I think the code you linked to isn't
> where the breakage actually is.  I think it's actually at
> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/chromeos-common-script/share/chromeos-common.sh#375
> ... where an init script is using the error message printed by 'e4crypt
> get_policy' to decide whether to add -O encrypt to the filesystem or not.
>
> It really should check instead:
>
>         [ -e /sys/fs/ext4/features/encryption ]

OK, I filed <https://crbug.com/1019939> and CCed all the people listed
in the cryptohome "OWNERS" file.  Hopefully one of them can pick this
up as a general cleanup.  Thanks!

-Doug


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
