Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC725F66EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 14:54:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogQO1-00034D-7G;
	Thu, 06 Oct 2022 12:54:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=tIOp=2H=zx2c4.com=Jason@kernel.org>)
 id 1ogQO0-000344-5X; Thu, 06 Oct 2022 12:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Hkd+03ZPFCZHL4SytFYjQxSlVLh/tCnsKNFxa5wK+g=; b=V8GTqRWKWCIoC+KdfabTpHAUXQ
 Cws0oy+5JXTVw2HipUZY2nG0kzw/6+48Qt0sEIUx5AXKeJXD2C8s2apDhgD7D5GqcAFlMd2vu2/YQ
 3OCq8zzvk8oft9RX/PvxdaxIRndTVQKWh4IVigjOwEyAVtfttFu1m9OX86ieyd5mv4wU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Hkd+03ZPFCZHL4SytFYjQxSlVLh/tCnsKNFxa5wK+g=; b=VKxAdvTEB6tBAOOHIl5L2Xb1FQ
 J2BfMQ6lnjnn6ZLq4tIvxWFYsEycb05QEmMmY5PAiPNNrf2L8dCsPaXf3I+wTKv5+HpyiNSZHKphD
 i6y4kGRikJunyDGfdped/+uSji+ZsYp7kRzH0KUnyaR6k2EWDaMiWHbpbcgQC8AJX9FQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogQNz-00Ehzc-AP; Thu, 06 Oct 2022 12:54:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90876B82089;
 Thu,  6 Oct 2022 12:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65819C433D6;
 Thu,  6 Oct 2022 12:53:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="JFNs4Haz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665060806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Hkd+03ZPFCZHL4SytFYjQxSlVLh/tCnsKNFxa5wK+g=;
 b=JFNs4Hazt/h3DVxpbrAbzMPE9whooDcKk8uIX5aTYNyaQ0ww6ONDZEpvj0pBCk5Bkl2DLt
 ktmEJcNw1Kn2Ot/YdbAehCwxq7qPZvj6WGsUyAnJyfFHg6BU5H6pbom+jt+FBFixHsfFyw
 FXN6BTv1V4qGzBVuWo2f1r2ZOkBYL5M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 82a088b4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 6 Oct 2022 12:53:26 +0000 (UTC)
Date: Thu, 6 Oct 2022 06:53:14 -0600
To: Kees Cook <keescook@chromium.org>
Message-ID: <Yz7PusEN5TG1PvJZ@zx2c4.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <202210052148.B11CBC60@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202210052148.B11CBC60@keescook>
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 05, 2022 at 09:55:43PM -0700, Kees Cook wrote:
 > It'd be nice to capture some (all?) of the above somewhere. Perhaps just
 > a massive comment in the header? I'll include (something like) this in
 some "how to use" documentation I'm working on separately. 
 Content analysis details:   (-4.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ogQNz-00Ehzc-AP
Subject: Re: [f2fs-dev] [PATCH v1 0/5] treewide cleanup of random integer
 usage
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
From: "Jason A. Donenfeld via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Darrick J . Wong" <djwong@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrii Nakryiko <andrii@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-sctp@vger.kernel.org, "Md . Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Christoph Hellwig <hch@lst.de>,
 Andy Gospodarek <andy@greyhouse.net>, Sergey Matyukevich <geomatsi@gmail.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Michael Ellerman <mpe@ellerman.id.au>,
 ceph-devel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Nilesh Javali <njavali@marvell.com>,
 Jean-Paul Roubelat <jpr@f6fbb.org>, Dick Kennedy <dick.kennedy@broadcom.com>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Potnuri Bharat Teja <bharat@chelsio.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>, linux-nfs@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Andy Lutomirski <luto@kernel.org>, linux-hams@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org,
 Neil Horman <nhorman@tuxdriver.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Michael Chan <michael.chan@broadcom.com>, linux-kernel@vger.kernel.org,
 Varun Prakash <varun@chelsio.com>, Chuck Lever <chuck.lever@oracle.com>,
 netfilter-devel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
 linux-media@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
 John Stultz <jstultz@google.com>, Stanislav Fomichev <sdf@google.com>,
 Gregory Greenman <gregory.greenman@intel.com>, drbd-dev@lists.linbit.com,
 dev@openvswitch.org, Leon Romanovsky <leon@kernel.org>,
 Helge Deller <deller@gmx.de>, Hugh Dickins <hughd@google.com>,
 James Smart <james.smart@broadcom.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Pravin B Shelar <pshelar@ovn.org>, Julian Anastasov <ja@ssi.bg>,
 coreteam@netfilter.org, Veaceslav Falico <vfalico@gmail.com>,
 Yonghong Song <yhs@fb.com>, Namjae Jeon <linkinjeon@kernel.org>,
 linux-crypto@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ganapathi Bhat <ganapathi017@gmail.com>, linux-actions@lists.infradead.org,
 Simon Horman <horms@verge.net.au>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Florian Westphal <fw@strlen.de>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Jon Maloy <jmaloy@redhat.com>, Vlad Yasevich <vyasevich@gmail.com>,
 Anna Schumaker <anna@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Haoyue Xu <xuhaoyue1@hisilicon.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-wireless@vger.kernel.org,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-nvme@lists.infradead.org,
 Michal Januszewski <spock@gentoo.org>, linux-mtd@lists.infradead.org,
 kasan-dev@googlegroups.com, Cong Wang <xiyou.wangcong@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 Ajay Singh <ajay.kathat@microchip.com>, Xiubo Li <xiubli@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 lvs-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Marco Elver <elver@google.com>,
 Yury Norov <yury.norov@gmail.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, KP Singh <kpsingh@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Keith Busch <kbusch@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>,
 linux-ext4@vger.kernel.org, Wenpeng Liang <liangwenpeng@huawei.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Xinming Hu <huxinming820@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jeff Layton <jlayton@kernel.org>, linux-xfs@vger.kernel.org,
 netdev@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 "David S . Miller" <davem@davemloft.net>,
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Vignesh Raghavendra <vigneshr@ti.com>, Peter Zijlstra <peterz@infradead.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Ayush Sawal <ayush.sawal@chelsio.com>,
 Andreas Noever <andreas.noever@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 linux-f2fs-devel@lists.sourceforge.net, Jack Wang <jinpu.wang@ionos.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, rds-devel@oss.oracle.com,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 dccp@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 SHA-cyfmac-dev-list@infineon.com, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, linux-block@vger.kernel.org,
 dmaengine@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>,
 cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com,
 Yishai Hadas <yishaih@nvidia.com>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 linuxppc-dev@lists.ozlabs.org, David Ahern <dsahern@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Vinod Koul <vkoul@kernel.org>, tipc-discussion@lists.sourceforge.net,
 Thomas Graf <tgraf@suug.ch>, Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, Martin KaFai Lau <martin.lau@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 05, 2022 at 09:55:43PM -0700, Kees Cook wrote:
> It'd be nice to capture some (all?) of the above somewhere. Perhaps just
> a massive comment in the header?

I'll include (something like) this in some "how to use" documentation
I'm working on separately.

> > I've CC'd get_maintainers.pl, which is a pretty big list. Probably some
> > portion of those are going to bounce, too, and everytime you reply to
> > this thread, you'll have to deal with a bunch of bounces coming
> > immediately after. And a recipient list this big will probably dock my
> > email domain's spam reputation, at least temporarily. Sigh. I think
> > that's just how it goes with treewide cleanups though. Again, let me
> > know if I'm doing it wrong.
> 
> I usually stick to just mailing lists and subsystem maintainers.

Lord have mercy I really wish I had done that. I supremely butchered the
sending of this, and then tried to save it by resubmitting directly to
vger with the same message ID but truncated CC, which mostly worked, but
the whole thing is a mess. I'll trim this to subsystem maintainers and
resubmit a v2 right away, rather than having people wade through the
mess.

To any one who's reading this: no more replies to v1! It clogs the
tubes.

> If any of the subsystems ask you to break this up (I hope not), I've got

Oh god I surely hope not. Sounds like a massive waste of time and
paperwork.

Jason


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
